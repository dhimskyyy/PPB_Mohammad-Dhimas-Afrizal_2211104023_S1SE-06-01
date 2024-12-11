// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';  // Import geolocator

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); // Pastikan file .env sudah terisi API Key
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Google Maps Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(-6.2088, 106.8456), // Jakarta
    zoom: 12.0,
  );

  Marker? selectedMarker;
  String? selectedAddress;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();  // Cek izin lokasi saat aplikasi dimulai
  }

  // Memeriksa izin lokasi
  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Jika izin ditolak selamanya, beri tahu pengguna untuk membuka pengaturan
      print("Lokasi ditolak selamanya. Buka pengaturan untuk memberi izin.");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getPlaceDetails(LatLng position) async {
    setState(() {
      isLoading = true; // Mulai loading saat mengambil detail
    });

    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          selectedAddress =
              "${placemark.street}, ${placemark.locality}, ${placemark.country}";
          selectedMarker = Marker(
            markerId: const MarkerId("selected_marker"),
            position: position,
            infoWindow: InfoWindow(
              title: "Lokasi Dipilih",
              snippet: selectedAddress,
            ),
          );
        });
      } else {
        print("Gagal mendapatkan alamat.");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false; // Selesai loading
      });
    }
  }

  void _onMapTap(LatLng position) {
    _getPlaceDetails(position);
  }

  // Menambahkan fungsi untuk Place Picker
  Future<void> _showPlacePicker() async {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      print("API Key tidak ditemukan!");
      return;
    }

    setState(() {
      isLoading = true; // Mulai loading saat menampilkan picker
    });

    try {
      Prediction? result = await PlacesAutocomplete.show(
        context: context,
        apiKey: apiKey,
        mode: Mode.overlay,
        language: "id", // Bahasa Indonesia
        components: [Component(Component.country, "id")],
      );

      if (result != null && result.placeId != null) {
        // Menampilkan hasil tempat yang dipilih
        print("Tempat yang dipilih: ${result.description}");

        // Mendapatkan detail dari tempat yang dipilih
        final places = GoogleMapsPlaces(apiKey: apiKey);
        PlacesDetailsResponse placeDetails =
            await places.getDetailsByPlaceId(result.placeId!);

        // Periksa jika result ada dan memiliki data
        if (placeDetails.result != null && placeDetails.result.geometry != null) {
          final lat = placeDetails.result.geometry!.location.lat;
          final lng = placeDetails.result.geometry!.location.lng;
          final name = placeDetails.result.name;
          final address = placeDetails.result.formattedAddress;

          setState(() {
            selectedAddress = address;
            selectedMarker = Marker(
              markerId: const MarkerId("selected_marker"),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(
                title: name,
                snippet: address,
              ),
            );
          });

          // Geser kamera ke lokasi yang dipilih
          mapController.animateCamera(
            CameraUpdate.newLatLng(LatLng(lat, lng)),
          );
        } else {
          print("Detail tempat atau koordinat tidak ditemukan.");
        }
      } else {
        print("Pencarian tempat tidak berhasil.");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false; // Selesai loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.place),
            onPressed: _showPlacePicker, // Menambahkan fungsionalitas place picker
            tooltip: 'Pick a Place',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: selectedMarker != null ? {selectedMarker!} : {},
              onTap: _onMapTap,
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ), // Menampilkan loading indicator
          if (selectedAddress != null && !isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Alamat yang dipilih: $selectedAddress",
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mapController.animateCamera(
            CameraUpdate.newLatLng(LatLng(-7.7956, 110.3695)), // Yogyakarta
          );
        },
        tooltip: 'Move Camera',
        child: const Icon(Icons.map),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String? _videoPath;

  void _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _videoPath = result.files.single.path;
      });
    }
  }

  void _submitForm() {
    if (_videoPath != null) {
      // Handle the upload process here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Uploading video')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Video"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton.icon(
              onPressed: _pickVideo,
              icon: const Icon(Icons.video_library),
              label: const Text('Select Video'),
            ),
            if (_videoPath != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Selected Video: $_videoPath',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';

// Model class for documents
class DocumentModel {
  final String name;
  final String url;
  final String type; // 'pdf' or 'image'

  DocumentModel({
    required this.url,
    required this.type,
    required this.name,
  });
}

// Sample list of documents
final List<DocumentModel> documents = [
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Python_Complete_Notes.pdf',
      type: 'pdf',
      name: 'Python Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/C_Complete_Notes.pdf',
      type: 'pdf',
      name: 'C Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Python_Complete_Notes.pdf',
      type: 'pdf',
      name: 'Python Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Android_CompleteNotes.pdf',
      type: 'pdf',
      name: 'Android Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Python_Complete_Notes.pdf',
      type: 'pdf',
      name: 'Python Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/C_Complete_Notes.pdf',
      type: 'pdf',
      name: 'C Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Python_Complete_Notes.pdf',
      type: 'pdf',
      name: 'Python Complete Notes'),
  DocumentModel(
      url:
          'https://cwh-full-next-space.fra1.cdn.digitaloceanspaces.com/notes/Android_CompleteNotes.pdf',
      type: 'pdf',
      name: 'Android Complete Notes'),
];

// Main page displaying the list of documents
class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Documents')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return GestureDetector(
            onTap: () => _openDocument(context, document),
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (document.type == 'image')
                    CachedNetworkImage(
                      imageUrl: document.url,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    )
                  else
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.picture_as_pdf, size: 50),
                        Text('Open PDF', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  const SizedBox(height: 8),
                  Text(
                    document.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _openDocument(BuildContext context, DocumentModel document) {
    if (document.type == 'image') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullImageView(url: document.url),
        ),
      );
    } else if (document.type == 'pdf') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewPage(url: document.url),
        ),
      );
    }
  }
}

// Page for viewing full-size images
class FullImageView extends StatelessWidget {
  final String url;

  const FullImageView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.contain,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class PDFViewPage<PDFViewPageState> extends StatefulWidget {
  final String url;

  const PDFViewPage({super.key, required this.url});

  @override
  createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  PdfController? _pdfController;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final ByteData byteData =
          await NetworkAssetBundle(Uri.parse(widget.url)).load(widget.url);
      final Uint8List pdfData = byteData.buffer.asUint8List();
      final pdfDocument = PdfDocument.openData(pdfData);

      setState(() {
        _pdfController = PdfController(document: pdfDocument);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading PDF: $e')),
      );
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF')),
      body: _pdfController == null
          ? const Center(child: CircularProgressIndicator())
          : PdfView(controller: _pdfController!),
    );
  }
}

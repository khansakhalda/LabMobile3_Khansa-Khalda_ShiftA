import 'package:flutter/material.dart';
import 'package:praktikum_3/sidemenu.dart';
import 'package:praktikum_3/custom_cards.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Tentang Aplikasi To-Do List',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Deskripsi Aplikasi',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aplikasi To-Do List ini dirancang untuk membantu Anda mengelola dan mengatur tugas-tugas harian Anda '
                    'dengan cara yang lebih terstruktur. Anda dapat menambahkan tugas baru, menetapkan prioritas, dan mengatur '
                    'tanggal jatuh tempo untuk memastikan semua tugas terselesaikan tepat waktu. Aplikasi ini sangat cocok untuk '
                    'pengguna yang ingin meningkatkan produktivitas dan manajemen waktu mereka.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fitur Utama',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FeatureCard(
              icon: Icons.add_task,
              title: 'Tambah Tugas',
              description:
                  'Menambahkan tugas baru dengan detail seperti deskripsi, prioritas, dan tanggal jatuh tempo. Anda juga bisa menandai tugas sebagai selesai jika sudah dikerjakan.',
              color: Colors.greenAccent,
            ),
            const FeatureCard(
              icon: Icons.priority_high,
              title: 'Pengaturan Prioritas',
              description:
                  'Setiap tugas dapat diberi prioritas yang berbeda: rendah, menengah, atau tinggi. Fitur ini membantu Anda untuk fokus pada tugas-tugas yang lebih penting terlebih dahulu.',
              color: Colors.orangeAccent,
            ),
            const FeatureCard(
              icon: Icons.calendar_today,
              title: 'Tanggal Jatuh Tempo',
              description:
                  'Tetapkan tanggal jatuh tempo untuk setiap tugas. Anda akan mendapatkan pengingat visual untuk tugas yang mendekati atau sudah melewati deadline.',
              color: Colors.blueAccent,
            ),
            const FeatureCard(
              icon: Icons.check_circle,
              title: 'Tandai Selesai',
              description:
                  'Tugas yang sudah selesai dapat ditandai, dan Anda bisa melihat kembali semua tugas yang sudah berhasil diselesaikan untuk memantau progres.',
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 20),
            const Text(
              'Manfaat Penggunaan Aplikasi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const BenefitCard(
              title: 'Produktivitas Meningkat',
              description:
                  'Dengan mengatur tugas secara terstruktur dan memprioritaskan pekerjaan, Anda akan lebih produktif dan dapat menyelesaikan lebih banyak tugas setiap hari.',
            ),
            const BenefitCard(
              title: 'Manajemen Waktu Lebih Baik',
              description:
                  'Dengan fitur tanggal jatuh tempo, Anda akan lebih mudah mengelola waktu dan memastikan semua tugas terselesaikan tepat waktu.',
            ),
            const BenefitCard(
              title: 'Motivasi Meningkat',
              description:
                  'Menandai tugas yang selesai memberikan rasa pencapaian, dan Anda akan lebih termotivasi untuk menyelesaikan tugas lainnya.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Panduan Penggunaan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '1. Menambah Tugas Baru',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Klik ikon "+" pada bagian atas layar untuk menambah tugas baru. Isi deskripsi, pilih prioritas, dan tetapkan tanggal jatuh tempo.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2. Mengedit dan Menghapus Tugas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Tekan lama pada tugas yang ingin diedit atau dihapus. Pilih opsi "Edit" untuk mengubah detail tugas atau "Hapus" untuk menghapus tugas dari daftar.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3. Menandai Tugas Sebagai Selesai',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Klik pada ikon kotak centang di samping tugas untuk menandai bahwa tugas tersebut telah selesai. Tugas yang telah selesai akan tampil dengan tanda centang hijau.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}

// Definisi kelas FeatureCard
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Definisi kelas BenefitCard
class BenefitCard extends StatelessWidget {
  final String title;
  final String description;

  const BenefitCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.check, color: Colors.green),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

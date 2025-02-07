import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketData extends StatelessWidget {
  const TicketData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: TicketWidget(
          width: 380,
          height: 600,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Live Concert 2025',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Band: Coldplay',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'VIP PASS',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1, height: 25, color: Colors.grey),

              // Ticket Details
              ticketDetailsWidget('Date', '15 Sep 2025', 'Time', '7:00 PM'),
              const SizedBox(height: 10),
              ticketDetailsWidget(
                  'Venue', 'Madison Square Garden', 'City', 'New York'),
              const SizedBox(height: 10),
              ticketDetailsWidget('Seat', 'A12', 'Row', '3'),
              const SizedBox(height: 10),
              ticketDetailsWidget('Price', '\$199', 'Category', 'Front Row'),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.qr_code_2,
                      size: 60,
                      color: Colors.black45,
                    ), // Placeholder for barcode
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Ticket ID
              const Center(
                child: Text(
                  'Ticket ID: 1029384756',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Branding
              const Center(
                child: Text(
                  'Powered by TicketMaster',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(
      String title1, String desc1, String title2, String desc2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              desc1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 2),
            Text(
              desc2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

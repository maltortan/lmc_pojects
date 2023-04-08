import 'package:flutter/material.dart';

class WeeklyJobsCard extends StatelessWidget {
  final String title;
  final List<String> daysOfWeek;
  final List<int> completedJobs;
  final List<String> jobDetails;

  WeeklyJobsCard({
    required this.title,
    required this.daysOfWeek,
    required this.completedJobs,
    required this.jobDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < daysOfWeek.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        daysOfWeek[i],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: completedJobs[i] > 0
                              ? Colors.green
                              : Colors.grey[300],
                        ),
                        child: Center(
                          child: Text(
                            "${completedJobs[i]}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Job Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            for (String jobDetail in jobDetails)
              Text(
                jobDetail,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

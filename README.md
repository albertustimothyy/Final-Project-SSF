# Final-Project-SSF

i Introduction to the problem and the solution

Dalam perkembangan zaman yang semakin pesat ini kebutuhan energi semakin tinggi. 
Hal ini memicu meningkatnya kebutuhan atas sistem smart home automation yang efisien secara energi. 
Konsep ini menjadi populer karena kemampuannya untuk meningkatkan kenyamanan, keamanan, 
dan efisiensi penggunaan energi listrik di rumah. 
Untuk itu kami bertekad untuk membuat perangkat yang dapat meminimalisir penggunaan listrik 
dengan cara mematikan penggunaan listrik ketika diruangan tersebut tidak ada orang sehingga tidak terjadi
pemborosan listrik.

Proyek ini juga dapat meningkatkan kenyamanan penghuni rumah. 
Misalnya, ketika seseorang memasuki ruangan, sensor gerak akan mendeteksi kehadiran 
mereka dan secara otomatis menyalakan lampu atau perangkat lainnya yang terhubung. 
Ketika tidak ada kehadiran manusia, maka lampu dan perangkat lainnya yang terhubung 
akan mati untuk menghemat energi listrik.

Dengan adanya proyek ini,  diharapkan dapat bermanfaat untuk penghuni rumah, 
sehingga mereka dapat menghemat energi dan meningkatkan kenyamanan dalam penggunaan 
perangkat listrik mereka. Selain itu, dengan proyek ini, diharapkan penghuni rumah 
dapat mengurangi biaya tagihan listrik mereka.

ii Hardware design and implementation details

Pada proyek ini kami memakai sistem yang akan mendeteksi pergerakan dengan suatu sensor.
yang kemudian sensor ini akan mengirimkan sinyal kepada alat alat elektronik seperti 
lampu, AC, dll. unuttuk menyala. Sensor yang kami gunakan adalah PIR sensor yang akan
mendeteksi pergerakan manusia. Karena sensor ini menggunakan infrared maka pergerakan
yang dapat terdeteksi adalah pergerakan benda dengan suhu saja, atau bisa kita bilang 
pergerakan manusia saja karena tubuh manusia menghasilkan panas yang dapat dideteksi
oleh infrared

Alat yang dibutuhkan adalah
1 PIR Sensor
1 Arduino
1 MAX 7219

iii Software implementation details

Implementasi dari software sistem, yang digunakan sebagai integrasi dari perangkat pada rangkaian 
atau hardware dilakukan dengan menulis kode pada Arduino IDE. Kode tersebut didasarkan oleh bahasa Assembly. 
Dengan mengirimkan kode tersebut ke rangkaian, maka segala perangkat akan berjalan sesuai dengan perintah-perintah 
yang diberikan pada program tersebut. 

Dalam pengembangan software proyek ini, digunakan file .ino dan .S untuk digunakan pada hardware-nya, 
yang merupakan Arduino. Program pada bagian software dirancang sedemikian rupa agar dapat mengirimkan hasil yang sesuai 
dengan perintah-perintah yang terdapat didalamnya. Program tersebut digunakan untuk membaca sensor dengan 
metode PIR sensor, kemudian mengendalikan modul MAX7219 melalui arduino. 
Program tersebut juga melakukan inisialisasi SPI, yang digunakan untuk mengirimkan perintah dan data ke modul MAX7219. 

iv. Test results and performance evaluation

Rangkaian dibuat menggunakan bantuan software proteus untuk mensimulasikan rangkaian yang direncanakan. Rangkaian terdiri atas 1 Arduino, Max7219, 1 Display, dan PIR sensor. PIR sensor digunakan untuk mendeteksi adanya keberadaan orang di dalam ruangan yang dimonitor. PIR sensor kemudian disambungkan ke Arduino yang bertindak sebagai master yang kemudian akan memproses sinyal yang diterima tersebut. Master kemudian menyalurkan sinyal ke Max7219. Max7219 akan kemudian menentukan untuk menyalakan atau mematikan aliran listrik tergantung sinyal yang dikirimkan oleh arduino master. Arduino slave juga disambungkan ke display untuk memberikan status mengenai ada atau tidaknya orang di dalam ruangan tersebut.

Proyek ini berhasil dirangkai dengan benar menggunakan proteus namun tidak berhasil berjalan dengan benar. PIR sensor berhasil membaca adanya orang yang masuk ke ruangan namun Max7219 tidak memberikan output kepada display yang diberikan untuk menandakan adanya orang di dalam ruangan





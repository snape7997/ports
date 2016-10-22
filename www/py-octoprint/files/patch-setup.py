--- setup.py.orig	2016-10-08 19:12:49 UTC
+++ setup.py
@@ -18,7 +18,7 @@ INSTALL_REQUIRES = [
 	"werkzeug>=0.11.1,<0.12",
 	"tornado>=4.4.2,<4.5",
 	"sockjs-tornado>=1.0.2,<1.1",
-	"PyYAML>=3.12,<3.13",
+	"PyYAML>=3.11,<3.13",
 	"Flask-Login>=0.3,<0.4",
 	"Flask-Principal>=0.4,<0.5",
 	"Flask-Babel>=0.11,<0.12",
@@ -26,15 +26,15 @@ INSTALL_REQUIRES = [
 	"markdown>=2.6.4,<2.7",
-	"pyserial>=3.1.1,<3.2",
+	"pyserial>=2.7,<3.2",
 	"netaddr>=0.7.17,<0.8",
-	"watchdog>=0.8.3,<0.9",
+	"watchdog>=0.8.2,<0.9",
 	"sarge>=0.1.4,<0.2",
 	"netifaces>=0.10,<0.11",
 	"pylru>=1.0.9,<1.1",
-	"rsa>=3.4,<3.5",
+	"rsa>=3.3,<3.5",
-	"pkginfo>=1.3.2,<1.4",
+	"pkginfo>=1.2.1,<1.4",
 	"requests>=2.11.1,<2.12",
-	"semantic_version>=2.6.0,<2.7",
-	"psutil>=4.3.1,<4.4",
+	"semantic_version>=2.4.2,<2.7",
+	"psutil>=4.3.0,<4.4",
 	"Click>=6.6,<6.7",
 	"awesome-slugify>=1.6.5,<1.7",
 	"feedparser>=5.2.1,<5.3",
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// for using authentication
FirebaseAuth auth = FirebaseAuth.instance;
// cloudstore ma data pathauna rw receive garna
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;


// collections
const usersCollection = "users";
const productsCollection = "products";
const cartCollection = "cart";
const chatsCollection = "chats";
const messagesCollection = "messages";

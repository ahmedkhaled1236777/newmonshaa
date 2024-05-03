importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");
const firebaseConfig = {
    apiKey: "AIzaSyDRQB5lSBFcr_dlzCLNVKOCjtoYetp97k8",
    authDomain: "mymonshaa.firebaseapp.com",
    projectId: "mymonshaa",
    storageBucket: "mymonshaa.appspot.com",
    messagingSenderId: "849173214576",
    appId: "1:849173214576:web:15af575abc82c4b6874bb5",
    measurementId: "G-QLRJ58S315"
  };
firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
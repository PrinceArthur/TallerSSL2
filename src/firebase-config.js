import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyDMHGUgEnZS2qOK7mnc-4oFyFaJOaw6-KU",
  authDomain: "cifradoafin.firebaseapp.com",
  projectId: "cifradoafin",
  storageBucket: "cifradoafin.appspot.com",
  messagingSenderId: "255319588510",
  appId: "1:255319588510:web:1964e1190799648211858f",
  measurementId: "G-SSQPK9S01F",
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);

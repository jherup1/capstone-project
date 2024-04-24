const admin = require('firebase-admin');
const serviceAccount = require('./psysearch-84c1b-firebase-adminsdk-rgp9z-ffc1a2913b.json');

// Initialize Firebase
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// Function to upload data
async function uploadData() {
    const data = require('deprecated_files/ron-scripts/universities_worldwide_lat_long_data.json'); // Replace with your JSON file path
    const collectionRef = db.collection('your_collection');

    for (const doc of Object.keys(data)) {
        await collectionRef.doc(doc).set(data[doc]);
    }

    console.log('Upload complete.');
}

uploadData().catch(console.error);

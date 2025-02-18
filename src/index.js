const express = require('express');
const app = express();

// Use the PORT environment variable
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
    res.send('Hello from Cloud Run!');
});

app.listen(PORT, () => {
    console.log(`✅ Server is running on port ${PORT}`);
});

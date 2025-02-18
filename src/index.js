const express = require('express');
const app = express();

// Use the PORT environment variable
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
    res.send('Assignment 2 – 100949693');
});

app.listen(PORT, () => {
    console.log(`✅ Server is running on port ${PORT}`);
});

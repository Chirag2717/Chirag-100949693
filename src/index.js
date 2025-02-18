const express = require('express');
const app = express();
const db = require('./persistence');
const getItems = require('./routes/getItems');
const addItem = require('./routes/addItem');
const updateItem = require('./routes/updateItem');
const deleteItem = require('./routes/deleteItem');

// ✅ Cloud Run dynamically sets PORT
const PORT = process.env.PORT || 8080;

app.use(express.json());
app.use(express.static(__dirname + '/static'));

app.get('/items', getItems);
app.post('/items', addItem);
app.put('/items/:id', updateItem);
app.delete('/items/:id', deleteItem);

db.init().then(() => {
    app.listen(PORT, () => console.log(`✅ Server running on port ${PORT}`));
}).catch((err) => {
    console.error("❌ Database initialization failed:", err);
    process.exit(1);
});

const gracefulShutdown = () => {
    console.log("⚠️ Shutting down server...");
    db.teardown()
        .catch((err) => console.error("❌ Error during shutdown:", err))
        .then(() => process.exit());
};

// ✅ Handle graceful shutdowns for Cloud Run
process.on('SIGINT', gracefulShutdown);
process.on('SIGTERM', gracefulShutdown);

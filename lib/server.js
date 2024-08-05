const express = require('express');
const cors = require('cors');
const app = express();

// CORS ayarları
app.use(cors({
  origin: 'http://localhost:9052' 
}));


app.get('/', (req, res) => {
  res.json({ message: 'CORS enabled' });
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});

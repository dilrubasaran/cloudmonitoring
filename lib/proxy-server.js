const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

app.use('/api', createProxyMiddleware({
  target: 'https://sm.aeyazilim.com',
  changeOrigin: true,
  pathRewrite: {
    '^/api': '', // '/api' yi kaldırır
  },
}));

app.listen(3000, () => {
  console.log('Proxy server is running on http://localhost:3000');
});

const { describe, it } = require('node:test');
const assert = require('node:assert');
const request = require('supertest');
const app = require('../index.js');

describe('Server Endpoints', () => {
  describe('GET /', () => {
    it('should return status 200', async () => {
      const response = await request(app).get('/');
      assert.strictEqual(response.statusCode, 200);
    });

    it('should return "Hello World!"', async () => {
      const response = await request(app).get('/');
      assert.strictEqual(response.text, 'Hello World!');
    });
  });
});

class ApiEndPoint {
  ///DEV API
  // static const baseUrl = 'http://192.168.18.16:8000/api/v1';//hafiz
  static const baseUrl = 'http://192.168.100.183:8000/api/v1';

  ///DEV
  static const login = '/auth/login';
  static const user = '/user';
  static const item = '/item';
  static const incomingGoods = '/istock/incomingGoods';
  static const outcomingGoods = '/istock/outcomingGoods';
  static const listIncomingGoods = '/ihist/incomingGoods';
  static const listOutcomingGoods = '/ihist/outcomingGoods';

  ///OPSI
  static const opsiRole = '/role';
  static const opsiCategory = '/category';
  static const opsiColor = '/color';
  static const opsiSize = '/size';
  static const opsiVendor = '/vendor';
}
class Api {
  static const auth = '/auth';
  static const login = '$auth/login';
  static const mapAutoComplete =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const mapDecodePlace =
      'https://maps.googleapis.com/maps/api/place/details/json';
  static const hostels = '/hostels';
  static const allFloors = '$auth/all-floors';
  static const floors = '$hostels/floors';
  static const createAdmin = '$auth/create-admin';
  static const changePassword = '$auth/change-password';
  static const users = '/users';
  static const profile = '$users/profile';
  static const rooms = '/rooms';
  static const bedToken = '/rooms/bed-token';
  static const roomTypes = '$rooms/room-types';
  static const s3 = '/s3-resources';
  static const upload = '$s3/upload';
  static const hostelers = '/hostelers';
  static const payments = '/payments';
  static const paymentsStatistics = '$hostels/payment-statistics';
  static const allPaymentStatistics = '$hostels/all-payment-statistics';
  static const statistics = '$hostels/statistics';
  static const allStatistics = '$hostels/all-statistics';
  static const monthStatus = '$payments/month-status';
  static const update = '$hostelers/update';
  static const delete = '$hostelers/delete';
  static const sendOtp = '$auth/send-otp';
  static const verifyOtp = '$auth/verify-otp';
  static const forgotPassword = '$auth/forgot-password';
  static const changeStatus = '/change-status';
  static const reassignHosteler = '$rooms/reassign-hosteler';
  static const totalAmount = '$payments/total-amount';
  static const tokens = '/tokens';
  static const charges = '/charges';
  static const bill = '/bill';
}

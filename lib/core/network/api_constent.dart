class ApiConstants{
  static const baseUrl = 'https://tasksapp.integration25.com/api';
  static const login = '$baseUrl/auth/login';
  static const logout = '$baseUrl/auth/logout';
  static const storeDepartment = '$baseUrl/department/store';
  static const getAllManger = '$baseUrl/user/show-managers';
  static const updateDepartment = '$baseUrl/department/update/1';
  static const getAllDepartment = '$baseUrl/department/index';
  static const getAllUser = '$baseUrl/user/index';
  static const addNewUser = '$baseUrl/user/store';
  static const updateUser = '$baseUrl/user/update/5';
  static const addTask = '$baseUrl/task/store';
  static const getAllTask = '$baseUrl/task/index';
  static const deleteTask = '$baseUrl/task/delete/';
}
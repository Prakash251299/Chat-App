package com.example.myapplication.data.api

class ApiHelper(private val apiService: ApiService) {
    suspend fun getUsers() = apiService.getUser()
}
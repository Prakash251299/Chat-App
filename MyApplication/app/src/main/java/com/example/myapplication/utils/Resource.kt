package com.example.myapplication.utils

data class Resource<out T>(val status: Status, val data: T?, val messaage: String?) {
    companion object {
        fun <T> success(data: T): Resource<T> = Resource(status = Status.SUCCESS, data = data, messaage = null)

        fun <T> error(data: T?, messaage: String): Resource<T> = Resource(status = Status.ERROR, data = data, messaage = messaage)
        fun <T> loading(data: T?): Resource<T> = Resource(status = Status.LOADING, data = data, messaage = null)

    }
}
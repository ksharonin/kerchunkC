/**
 * @file detect_dtype.h
 * @brief given dtype as string, detect endianness, type, size 
 * @version 0.1
 * 
 * @note requires more testing and coverage
 */

#include <iostream>
#include <string>
#include <cstddef>
#include <cctype>

enum class Endianness { LITTLE, BIG, UNKNOWN };
enum class DataType { UNKNOWN, 
                    BIT_FIELD, 
                    BOOLEAN, 
                    INTEGER, 
                    UNSIGNED_INTEGER, 
                    FLOATING_POINT, 
                    COMPLEX_FLOAT, 
                    TIMEDELTA, 
                    DATETIME, 
                    OBJECT, 
                    STRING, 
                    UNICODE, 
                    OTHER };

struct TypeInfo {
    Endianness endianness;
    DataType dataType;
    std::size_t size;
};

TypeInfo parseDtype(const std::string& dtype) {
    Endianness endianness = Endianness::UNKNOWN;
    DataType dataType = DataType::UNKNOWN;
    std::size_t size = 0;

    if (dtype.size() < 2) {
        std::cerr << "ERR: invalid dtype format." << std::endl;
        return { endianness, dataType, size };
    }

    // endianness
    if (dtype[0] == '<') {
        endianness = Endianness::LITTLE;
    } else if (dtype[0] == '>') {
        endianness = Endianness::BIG;
    } else if (dtype[0] == '|') {
        endianness = Endianness::UNKNOWN; // dn matter
    } else {
        std::cerr << "Invalid endianness specifier." << std::endl;
        return { endianness, dataType, size };
    }

    // type and size
    char dtypeChar = dtype[1];
    if (isdigit(dtype[2])) {
        size = dtype[2] - '0';
    } else {
        std::cerr << "Invalid size specifier in dtype." << std::endl;
        return { endianness, dataType, size };
    }

    switch (dtypeChar) {
        case 't':
            dataType = DataType::BIT_FIELD;
            break;
        case 'b':
            dataType = DataType::BOOLEAN;
            break;
        case 'i':
            dataType = DataType::INTEGER;
            break;
        case 'u':
            dataType = DataType::UNSIGNED_INTEGER;
            break;
        case 'f':
            dataType = DataType::FLOATING_POINT;
            break;
        case 'c':
            dataType = DataType::COMPLEX_FLOAT;
            break;
        case 'm':
            dataType = DataType::TIMEDELTA;
            break;
        case 'M':
            dataType = DataType::DATETIME;
            break;
        case 'O':
            dataType = DataType::OBJECT;
            break;
        case 'S':
            dataType = DataType::STRING;
            break;
        case 'U':
            dataType = DataType::UNICODE;
            break;
        case 'V':
            dataType = DataType::OTHER;
            break;
        default:
            std::cerr << "Unknown data type in dtype." << std::endl;
            return { endianness, dataType, size };
    }

    return { endianness, dataType, size };
}

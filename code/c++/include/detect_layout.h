/**
 * @file detect_layout.h
 * @brief given chunk and shape information, identify h5 style format
 * @version 0.1
 * 
 * @note need to support compact, contiguous, chunked
 * @note contig dn have filters/compression(?) applied
 */

// layout_t myLayout = CHUNKED_LAYOUT;
typedef enum {
    COMPACT_LAYOUT          = 0,
    CONTIGUOUS_LAYOUT       = 1,
    CHUNKED_LAYOUT          = 2,
    UNKNOWN_LAYOUT          = 3
} layout_t;
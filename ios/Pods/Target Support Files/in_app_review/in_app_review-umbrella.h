#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "InAppReviewPlugin.h"

FOUNDATION_EXPORT double in_app_reviewVersionNumber;
FOUNDATION_EXPORT const unsigned char in_app_reviewVersionString[];


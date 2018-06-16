//
//  Header.h
//  KKListKit
//
//  Created by LV on 2018/6/15.
//  Copyright © 2018年 KK.inc. All rights reserved.
//

#ifndef KKAssert
#define KKAssert(condition, ... ) NSCAssert( ( condition ) , ##__VA_ARGS__)
#endif

#ifndef KKFailAssert
#define KKFailAssert(...) KKAssert( (NO), ##__VA_ARGS__)
#endif

#ifndef KKParameterAssert
#define KKParameterAssert( condition ) KKAssert( (condition) , @"Invalid parameter not satisfying:%@", @#condition)
#endif

#ifndef KKAssertMainThread
#define KKAssertMainThread() KKAssert([NSThread isMainThread] == YES, @"XXKKSectionControler init must be on the main thread")
#endif

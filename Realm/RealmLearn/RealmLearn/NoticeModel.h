//
//  NoticeModel.h
//  RealmLearn
//
//  Created by mac on 2020/8/29.
//Copyright © 2020 Dever.G. All rights reserved.
//

#import <Realm/Realm.h>

@interface NoticeModel : RLMObject
@property int a;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<NoticeModel *><NoticeModel>
RLM_ARRAY_TYPE(NoticeModel)

/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import display from '@ohos.display';
import CardModel from "../../viewModel/CardModel"

/**
 * constant about common feature
 */
export default class CommonConstants {

  static readonly FULL_LENGTH = '100%';


  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;

  //
  // /**
  //  * index tab item feature
  //  */
  static readonly INDEX_TAB = [
    new CardModel($r('app.media.ic_tab_main_select'),$r('app.media.ic_tab_main_default'),'首页'),
    new CardModel($r('app.media.ic_tab_file_select'),$r('app.media.ic_tab_file_default'),'理财'),
    new CardModel($r('app.media.ic_tab_cloud_select'),$r('app.media.ic_tab_cloud_default'),'生活'),
    new CardModel($r('app.media.ic_tab_copy_select'),$r('app.media.ic_tab_copy_default'),'其他'),
    new CardModel($r('app.media.ic_tab_mine_select'),$r('app.media.ic_tab_mine_default'),'我的')
  ];
}
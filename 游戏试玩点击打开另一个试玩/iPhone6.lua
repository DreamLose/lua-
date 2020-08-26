--所用到的颜色
m = {
    needPwd = {0x000000, "-2|0|0xffffff,-2|9|0x000000,20|28|0x000000,17|28|0xffffff,59|28|0x000000,95|12|0xffffff,94|14|0x000000,124|20|0x000000,125|20|0xffffff", 90, 12, 324, 271, 857, '需要密码'},
	needPwdBtn = {0x4cd964, "-4|-2|0xffffff,-15|26|0x4cd964,-17|26|0xffffff,20|55|0x4bd662,14|64|0xffffff,41|49|0xffffff,36|51|0x40b754,28|25|0xffffff,22|26|0x4ad261", 90, 555, 547, 746, 979, '需要密码开关'},
	passwordSetting = {0x000000, "-3|0|0xffffff,-3|3|0x000000,-1|7|0x171717,2|6|0xffffff,60|3|0x000000,58|5|0xffffff,118|28|0x000000,103|20|0x2a2a2a,103|22|0xffffff", 90, 16, 118, 335, 448, '密码设置'},
	needPwdIn15Min = {0x000000, "-2|0|0xffffff,7|3|0x000000,53|-7|0x000000,57|-7|0xffffff,62|-7|0x000000,137|-8|0x000000,139|-6|0xffffff,141|1|0x000000,170|21|0x000000", 90, 12, 324, 271, 857, '15分钟后需要'},
}
--------------------------------全局参数-----------------------------------------------
m['灰']={{470,17,0x939395},{470,20,0x939395},{500,10,0x939395},{500,17,0x939395},{500,20,0x939395}}
m.gray2 = {0x939394, "0|10|0x939394,65|0|0x939394,65|10|0x939394,140|0|0x939394,140|10|0x939394,260|0|0x939394,260|10|0x939394,328|0|0x939394,328|10|0x939394", 90, 160, 2, 580, 52, '灰色弹窗'}
m.useLocationBG = {0x000000, "2|0|0xf9f9f9,-23|2|0x000000,-25|2|0xf9f9f9,-25|28|0x000000,0|29|0x000000,30|4|0x000000,27|2|0xf9f9f9,56|21|0x000000,58|20|0xf9f9f9", 90, 339, 585, 478, 628, '一直在后台使用位置'}
--------------------------------登录判断区域-------------------------------------------------
m.preferences = {'preferences_6.png',233, 43, 523, 125, 20000000}
m.preferencespic = { 0x000000, "-2|4|0xf6f6f7,-2|7|0x000000,14|11|0x000000,14|14|0xf6f6f7,14|19|0x000000,45|-1|0x000000,46|20|0x000000,56|24|0x000000,58|24|0xf6f6f7", 90, 310, 49, 448, 128,'设置title'}
m.loginPage = {'loginCell_6.png',0,0,750,1333, 30000000}

m.iTunes与App = {'iTunesAndApp_6.png',134, 36, 621, 160,40000000}
m.App与iTunes = {'appAndITunes_6.png',134, 36, 621, 160,40000000}
m.iTunes与App_2 = {'iTunesAndApp_6_10.0.2.png', 134, 36, 621, 160,40000000}

m.AppleID={'AppleID_6.png',  2, 173, 230, 323,1000000}
m.登录={'login_6.png', 0, 184, 200, 304,10000000}
m.正在登录 = {"login_win_grey_6.png", 0, 184, 200, 304,1000000}
m.openSwitch = {'openSwitch_6.png',511, 403, 741, 1137,1000000}

m.密码={"passWord_6.png",  20, 172, 400, 928,1000000}
m.密码黑点= {0xffffff, "9|-1|0x000000,18|0|0xffffff,22|1|0x000000,43|0|0x000000,57|-1|0x000000,49|-2|0xffffff", 90, 138, 460, 224, 499}

m.登录按钮={'login_win_blue_6.png', 376, 413, 639, 715,1000000}
m.登录灰={"login_grey_6.png", 388, 531, 638, 620,1000000}
m.wrongAppleIdZone = {'wrongAppleIdZone_6.png', 60, 290, 685, 740}
m.needAppleIdLogin_9 = {'needAppleIdLogin_6_9.png', 99, 252, 649, 782}
m.needAppleIdLogin_10 = {'needAppleIdLogin_6_10.png', 99, 252, 649, 782}

m.注销={'logout_6.png', 223, 662, 522, 800,2000000}
m.注销2={'logout_6_2.png', 223, 662, 522, 800,2000000}
m.取消={"cancel_6.png",181, 730, 552, 949,2000000}
m.commonCancel = {'cancel_6_2.png', 59, 428, 679, 949, 20000000}
m.continueBtn={'continueBtn_6.png', 335, 428, 650, 968, 20000000}
m.needValidation={'needValidation_6.png',165, 46, 594, 150,20000000}
m.needValidation2={'needValidation_6_10.png',165, 46, 594, 150,20000000}
m.identifyingCodeIput={'identifyingCodeIput_6.png', 113, 280, 360, 725, 5000000}
m.nextPage={'nextPage_6.png',534, 49, 744, 153,20000000}
m.identifyingCode={0x000000, "1|0|0x000000", 90, 140, 562, 610, 670}
m.identifyingCode_10 = {0x000000, "1|0|0x000000", 90, 140, 610, 610, 720}
m.identifyingCode_3 = {0x000000, "1|0|0x000000", 90, 140, 180, 610, 295}
m.identifyingCode_down = {0x000000, "1|0|0x000000", 90, 140, 675, 610, 700}
m.refreshCheckoutCode = {'refreshCheckoutCode_6.png', 5, 274, 730, 1000, 30000000}

---------------------------------APP搜索区域-------------------------------------------------
appStoreBar = {{75,1275},{220,1275},{375,1275}}
m.openInAppStore = {'openInAppStore_6.png', 155, 630, 635, 940, 30000000}
m.cantVerifyServer = {0x000000, "-3|0|0xf6f4f1,86|17|0x000000,89|17|0xf4f2ee,178|24|0x000000,179|27|0xf1f0ef,249|25|0x000000,253|27|0xefefef,292|0|0xefefef,296|0|0x000000", 90, 159, 381, 591, 675}
m.搜索={"search_grey_6.png", 403, 1217, 605, 1333, 20000000}
m.搜索blue= {"search_blue_6.png", 403, 1217, 605, 1333, 20000000}
m.blueSearch = {0x007aff, "31|0|0x007aff,15|-10|0x007aff,15|24|0x007aff,42|34|0x007aff,6|53|0x0d81fe,19|54|0x007aff,39|57|0x007aff,24|57|0x007aff", 90, 413, 1242, 553, 1328,'蓝色搜索'}
m.confirmKey = {'confirmKey_6.png', 492, 1077, 743, 1327}

m['top-搜索']={"searchBar_6.png", 235, 27, 505, 185,10000000}
m['空格']={"blank_6.png",280, 1249, 542, 1313}
m['空格_us']={"blank_us_6.png",280, 1249, 542, 1313}

m['搜']={"searchButton_us_6.png", 555, 1187, 747, 1331}
m.中文搜索={"searchButton_6.png", 555, 1187, 747, 1331}

m['热门搜索']={'hotSearch_6.png',140, 179, 542, 424,20000000}
m.searchBack = {'searchBack_6.png', 2, 20, 240, 150, 20000000}
---------------------------------下载区域----------------------------------------------------
m.download_null = { "download_null_6.png", 60, 490, 680, 890,40000000}
m.cant_download = {'cant_download_6.png', 90, 286, 660, 800, 30000000}
m.cantDownloadApp = {'cantDownloadApp_6.png', 86, 520,686,708, 30000000}
m.cant_purchase = {'cant_purchase_6.png', 90, 286, 660, 800, 30000000}
m.haoBtn = {'haoBtn_6.png', 90, 250, 660, 840, 20000000}

m.briefValidation = {'briefValidation_6.png', 40, 186, 712, 992, 30000000}
m.briefValidation2 = {'briefValidation_6_10.png', 40, 186, 712, 992, 30000000}
m.briefValidation3 = {'briefValidation_6_10_2.png', 40, 186, 712, 992, 30000000}
m.retryBtn = {'retry_6.png',  44, 316, 706, 870, 30000000}
m.completeBtn = {'completeRightUp_6.png',  44, 316, 706, 870, 30000000}
m.confirmPayInfo = {'confirmPayInfo_6.png', 100, 210, 650, 700, 20000000}
m.confirmPayInfo2 = {'confirmPayInfo_6_10.png', 100, 210, 650, 700, 40000000}
m.accountSetting = {'accountSetting_6.png', 209, 47, 571, 144,20000000}
m.accountSetting2 = {'accountSetting_6_10.png', 209, 47, 571, 144,20000000}
m.whitout={'whitout_6.png', 4, 260, 237, 932,20000000}
m.tableNoFull={'tableNoFull_6.png',11, 411, 745, 779,20000000}
m.tableNoFull2={'tableNoFull_6_10.png',11, 411, 745, 779,20000000}
m.tableNoFull3 = {0xfe1313, "1|0|0xfe1313", 90, 0, 129, 359, 417}
m.billAddress = {'billAddress_6.png', 15, 279, 232, 726, 10000000}
m.requestTimeout = {'requestTimeout_6.png', 185, 500, 585, 683, 20000000}

m.获取={'get_6.png',  547, 108, 739, 517,30000000}

m.正在下载={'download_6.png',  547, 108, 739, 517,20000000}
m.正在下载_all={'download_all_6.png',547, 108, 739, 517,30000000}

m.安装={"install_6.png",  547, 108, 739, 517,30000000}
m.loginInAppStore = {"loginInAppStore_6.png", 200, 377, 550, 700, 30000000}

m.打开={'open_6.png',  547, 108, 739, 517,30000000}
m.open2 = {0x030a14, "3|4|0xd7f4ff,8|4|0x030a14,26|17|0x030a14,26|20|0xd7f4ff,26|23|0x030a14,47|33|0x030a14,50|34|0xd7f4ff,62|33|0x030a14,67|23|0x030a14", 90, 527, 363, 743, 711, '携程打开'}
m.open3 = {0x030a14, "3|3|0xd7f4ff,8|-1|0x030a14,8|2|0xd7f4ff,8|5|0x030a14,6|6|0xd7f4ff,5|8|0x030a14,1|8|0xd7f4ff,-1|8|0x030a14,12|11|0xd7f4ff", 90, 388, 368, 740, 725, '携程open'}

m.更新={ "update_6.png", 547, 108, 739, 517,20000000}

m.云={ "yun_6.png",  547, 108, 739, 517,10000000}
m.新云= {0x0080fc, "0|-2|0xffffff,0|12|0x0080fc,-1|24|0xffffff,-6|24|0x0080fc,3|24|0xffffff,7|24|0x0080fc,10|20|0xffffff,1|20|0x0080fc,-11|19|0xffffff", 90, 307, 135, 729, 809, '新云'} --{ "yunNew_6.png",  547, 108, 739, 517,10000000}
m.取得 = {0x0080fc, "1|3|0xffffff,1|6|0x0080fc,6|16|0x0080fc,16|19|0x0080fc,37|14|0x0080fc,37|17|0xffffff,34|18|0x0080fc,38|21|0x0080fc,36|12|0xffffff", 90, 521, 185, 748, 427, '取得'}
m.searchBlueRect = {0x0080fc, "-39|0|0x0080fc,-39|-2|0xffffff,-48|2|0x0080fc,-50|0|0xffffff,-50|24|0x0080fc,-51|24|0xffffff,-47|48|0x0080fc,-46|46|0xffffff,-7|49|0x0080fc", 90, 381, 153, 747, 465, '蓝色方框'}
m.blueRect = {0x0080fc, "-8|7|0x0080fc,-8|42|0x0080fc,0|50|0x0080fc,0|47|0xffffff,0|2|0xffffff,74|2|0xffffff,74|-1|0x0080fc,83|8|0x0080fc,-11|15|0xffffff", 90, 381, 153, 747, 465, '蓝色方框'}
m.hanwen = {0x007aff, "0|7|0xf7f7f7,-10|9|0x007aff,-9|12|0xf7f7f7,-12|14|0x007aff,0|20|0x007aff,0|23|0xf7f7f7,0|28|0x007aff,39|19|0x007aff,39|25|0xf7f7f7", 90, 196, 595, 634, 939, '韩文好的'}
m.hanwen2 = {0x1d87fc, "1|2|0xf8eae3,1|7|0x027bff,8|4|0x3b95f8,12|8|0x007aff,10|6|0xf8eae2,19|10|0x55a0f5,27|12|0xf8e9e2,29|15|0x007aff,27|15|0xf8e9e2", 90, 471, 1294, 560, 1332, '韩文搜索'}
m.updateAppFree = {'updateAppFree_6.png', 50, 335, 666, 880, 30000000}
---------------------------------弹窗提示----------------------------------------------------
m.选择wifi={'wifi_6.png', 0, 255, 746, 564,20000000}

m.选择wifi_top={'wifi_6.png', 3, 6, 746, 336,20000000}

m.登录iTunes={'loginiTunes_6.png', 3, 208, 749, 577,40000000}
m.登录iTunes2={'loginiTunes_6_10.png', 3, 208, 749, 577, 40000000}

m.needLogin={'needLogin_6_10.png', 36, 212, 730, 828,30000000}

m.十五分需要={'15minNeed_6.png', 2, 418, 746, 765,40000000}
m.十五分需要_top={'15minNeed_6.png',1, 230, 741, 429,30000000}

m.保存密码={'savePassWord_6.png', 2, 418, 746, 765, 40000000}

m.无法连接到={'cantiTunes_6.png', 0, 342, 749, 854, 40000000}
m.无法连接到2 = {'cantiTunes_6_10.png', 0, 342, 749, 854, 40000000}

m.cantAppStore_2 = {'cantAppStore_6.png', 10, 572, 740, 752, 40000000}

m.completeBtnRightUp = {"completeRightUp_6.png", 486, 6, 746, 148,10000000}
m.cancelBtnBottom = {"cancelBottom_6.png", 208, 1180, 540, 1316,40000000}

--m.无法连接到_top={'cantiTunes.png', 4, 0, 599, 545,40000000}

--m.无法连接AppStore={ "cantAppStore.png", 4, 147, 639, 648,40000000}

--m.无法购买={'cantBuy.png',4, 260, 634, 797,40000000}

m.登录black={'login_black_6.png', 3, 281, 748, 751, 40000000}

--m.验证失败_top={'check.png', 0, 116, 630, 358,30000000}
m.验证失败={'checkFail_6.png', 101, 54, 641, 709, 40000000}
m.验证失败2={'checkFail_6_10.png', 101, 54, 641, 709, 40000000}
m.appIdLock  ={0x1d1d1d, "0|3|0xf9f9f9,106|-3|0x0b0b0b,106|-1|0xf9f9f9,106|2|0x000000,172|-1|0x000000,170|-2|0xf9f9f9,169|-1|0x050505,177|12|0x111111,177|13|0xf9f9f9", 90, 50, 401, 748, 867,'账号锁定'}
m.验证AppleID={ "checkAppleId_6.png", 201, 365, 527, 784, 40000000}

--m.编辑主屏幕={ "editMain.png", 0, 287, 631, 564,40000000}


m.不再另外收费={ 0x000000, "-6|5|0x000000,0|29|0x000000,43|18|0x000000,53|4|0x000000,28|4|0x000000", 90, 436, 525, 513, 570}
-- m.验证失败={ 0x000000, "12|-4|0xf9f9f9,21|0|0x000000,24|7|0x010101,31|-6|0x000000,36|-3|0xf9f9f9,36|-1|0x000000", 90, 319, 475, 390, 519}
-- m.验证失败2={0xfaefe4, "14|0|0x000000,18|-6|0xfaece0,28|1|0xfaeadc,32|-2|0x000000,88|4|0x000000,124|-2|0xfae9d9", 90, 196, 451, 444, 583}

m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m.购买过了={ 0x000000, "9|-4|0xf9f9f9,26|-4|0x000000,30|12|0x000000,35|16|0xf9f9f9,38|15|0x000000", 90, 436, 524, 508, 565}
m.无法下载项目={ 0x000000, "0|7|0xefefee,0|8|0x020202,-3|28|0x000000,17|23|0xefede9,18|28|0x010101", 80, 388, 481, 422, 519}
m.免费项目={ 0xf8f8f9, "3|-3|0x000000,8|-3|0xf8f8f9,9|-4|0x090909,49|18|0x000000,49|16|0xf7f7f9", 90, 411, 458, 515, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m['需要验证']={{385,470,0x000000},{380,473,0xf8f8f8},{486,674,0x007aff},{165,683,0x007aff},}
m.帐户设置={{259,69,0x000000},{259,100,0xf6f6f8},{291,72,0x060606},{316,83,0xf6f6f7},{349,83,0x000000},{380,82,0x000000},}
m.帐户设置完成={ 0x007aff, "0|-3|0xf6f6f8,0|-5|0x067dff", 90, 562, 75, 612, 95}
m['unbale']={{91,444,0x0a0a0a},{371,444,0x000000},{546,460,0x000000},{326,697,0x007aff},{299,697,0x007aff},}
m.蓝色提示={ 0x007aff, "0|6|0x007aff", 90, 120, 500, 630, 1000}
---------------------------------帐号处理区域------------------------------------------------
m.appleIdNotActived = {'appleIdNotActived_6.png', 201, 433, 524, 772, 20000000}
m.appleIdNotActivedE = {'appleIdNotActived_e6.png', 200, 433, 550, 772, 30000000}
m.appleIdNeedShortMsg = {'shortMsg_6.png', 288, 637, 698, 936, 20000000}
m.锁定={'appleID_lock_6.png',  0, 394, 749, 785, 40000000}

m.appleIdLocked = {'appleID_locked_6.png', 115, 299, 613, 699, 20000000}
m.billError = {0x000000, "3|0|0xdfd8d9,8|0|0x000000,114|14|0x000000,116|16|0xe1dede,119|16|0x000000,236|12|0x000000,280|1|0x000000,284|1|0xead7cb,366|22|0x000000", 90, 93, 425, 689, 897,'先前的购买存在账单问题'}
m.doubleVerify = {0x000000, "0|2|0xffffff,1|11|0x000000,15|28|0x000000,18|28|0xffffff,44|32|0x2f2f2f,224|5|0x000000,268|23|0x000000,270|49|0xffffff,270|52|0x000000", 90, 158, 80, 624, 376,'双重验证'}
m.禁用={ 0x000000, "-2|3|0xf9f9f9,15|0|0x000000,12|13|0x000000,12|15|0xf9f9f9,15|17|0x000000", 90, 368, 463, 410, 502}
m.禁用2 = {'appleID_forbiden_6.png', 160, 426, 559, 882, 30000000}
m['停用']={'appleID_stop_6.png', 1, 479, 747, 799, 40000000}
m.停用2 = {'appleID_stop_6_10.png', 1, 479, 747, 799, 40000000}
m.appleIdNoChecked = {'appleIdNoChecked_6.png', 80, 400, 665, 720, 30000000}
m.appleIdNoChecked2 = {'appleIdNoChecked_6_10.png', 80, 400, 665, 720, 30000000}
m.unCheckAppleID = {'unCheckAppleID_6.png', 1, 106, 749, 823}
m.accountNotInThisStore = {'accountNotInThisStore_6.png', 200, 500, 550, 750, 30000000}
m.moreError = {'moreError_6.png',41, 45, 667, 731, 20000000}
m.moreError2 = {'moreError_6_10.png',41, 45, 667, 731, 20000000}
---------------------------------修改协议----------------------------------------------------
m.立即下载={ 0x000000, "17|-18|0xf3f3f4,28|-21|0x000000,52|-25|0x000000,54|3|0x000000,111|3|0x000000,131|-19|0x000000", 80, 239, 445, 390, 524}
m.协议更改={ 0x000000, "21|3|0xf9f9f9,23|1|0x000000,20|26|0x000000,59|5|0x000000,59|3|0xf9f9f9,61|1|0x000000", 90, 486, 441, 561, 486}
m['协议iTunesStore']={{224,84,0x000000},{235,76,0xf7f7f7},{237,75,0x000000},{356,78,0x000000},{417,87,0x070707},{417,88,0xf7f7f7},}
m.协议同意={ 0x007aff, "20|-2|0x007aff,29|0|0xf7f7f7,31|6|0x007aff", 90, 549, 1069, 626, 1113}
m.协议弹窗同意={ 0x007aff, "23|-5|0xf9f9f9,25|-7|0x007aff,9|6|0x007aff,9|7|0xf9f9f9,56|3|0x007aff", 90, 413, 625, 494, 671}
m.协议完成={ 0x007aff, "0|5|0x007aff,6|12|0x007aff,51|1|0x007aff", 90, 547, 60, 627, 109}

m.protocolChange = {'protocolChange_6.png',120, 511, 635, 630} 		--弹窗
m.protocolArgee = {'protocolArgee_6.png',113, 547, 642, 698}		--弹窗
m.protocolArgee_2 = {'protocolArgee_6_2.png',113, 547, 642, 698}

m.protocoliTunes = {'protocoliTunes_6.png',265, 63, 483, 109}			--标题
m.protocolDone = {'protocolDone_6.png', 590, 55, 744, 122}		--完成按钮
---------------------------------协议修改--END-----------------------------------------------
m.commentBtnWhite = {'commentBtnWhite_6.png',316, 367, 423, 582, 5000000}
m.commentBtnGrey = {'commentBtnGrey_6.png', 316, 367, 423, 582, 5000000}
m.writeCommentBtn = {'writeCommentBtn_6.png', 48, 785, 340, 1092, 20000000}
m.writeCommentTitle = {'writeCommentTitle_6.png', 229, 28, 526, 152, 20000000}
m.commentStars = {'commentStars_6.png', 150, 98, 607, 228, 20000000}
m.createNickName = {'createNickName_6.png', 1, 175, 421, 493, 10000000}
m.commentTitle = {'commentTitle_6.png', 1, 175, 421, 493, 1000000}
m.commentContent = {'commentContent_6.png', 1, 175, 421, 493, 1000000}
m.commentSendBtn = {'commentSendBtn_6.png', 557, 17, 747, 130, 20000000}
m.commentNickNameOccupied = {'commentNickNameOccupied_6.png', 94, 233, 652, 598, 20000000}
m.OKBtn = {'okBtn_6.png', 220, 438, 534, 757, 20000000}
m.commentNeedPurchase = {'commentNeedPurchase_6.png', 75, 262, 660, 638, 20000000}

---------------------------------vpn-----------------------------------------------
m.generalBtn = {'generalBtn_6.png', 8, 130, 180, 1326, 20000000}
m.generalBtnpic= {0x8e8e93, "2|1|0xffffff,6|1|0x8e8e93,9|1|0xffffff,13|3|0x929297,3|16|0xffffff,8|16|0x8e8e93,10|21|0xffffff,10|25|0x8e8e93,3|25|0xffffff", 90, 6, 182, 550, 1152,'通用btn'}	
m.generalTitle = {'generalTitle_6.png', 145, 30, 635, 130, 20000000}
m.generalTitlepic = { 0x000000, "0|2|0xf5f5f7,0|6|0x000000,5|23|0x000000,5|25|0xe1e1e3,5|27|0x000000,29|26|0x000000,32|26|0xf5f5f7,37|27|0x000000,38|16|0x000000", 90, 314, 43, 441, 117,'通用title'}
m.vpnSettingItem = {'vpnSettingItem_6.png', 8, 130, 180, 1326, 20000000}
m.vpnSettingItempic = {0x000000, "8|14|0xffffff,8|18|0x000000,15|2|0x000000,27|7|0xffffff,27|11|0x000000,43|9|0x000000,47|9|0xffffff,51|9|0x000000,60|-1|0x000000", 90, 16, 310, 432, 984,'vpnBtn'}
m.VPNTitlepic = { 0x000000, "7|-1|0xf5f5f7,15|-1|0x000000,6|18|0x000000,23|6|0x000000,33|6|0xf5f5f7,36|6|0x000000,55|13|0x000000,57|11|0xf5f5f7,61|16|0x000000", 90, 302, 40, 451, 125,'VPNTitle'}
m.VPNTitle = {'VPNTitle_6.png', 145, 30, 635, 130, 20000000}
m.addVPNConfig = {'addVPNConfig_6.png', 8, 130, 555, 1326, 20000000}
m.addVPNConfig2 = {'addVPNConfig_10_6.png', 8, 130, 555, 1326, 20000000}
m.VPNConfigEditBtn = {'VPNConfigEditBtn_6.png',  620, 150, 744, 1326, 20000000}
m.VPNConnectBtn = {'VPNConnectBtn_6.png', 380, 140, 745, 430, 20000000}
m.VPNConnected = {'VPNConnected_6.png', 380, 140, 745, 430, 10000000}
m.targetVPNConfig = {'targetVPNConfig_6.png', 10, 130, 300, 1326, 20000000}
m.selectedTargetVPNConfig = {'selectedTargetVPNConfig_6.png', 10, 130, 300, 1326, 9000000}
m.addVPNConfigTitle = {'addVPNConfigTitle_6.png', 145, 30, 635, 130, 40000000}
m.VPNDesc = {'VPNDesc_6.png', 6, 130, 260, 600, 20000000}
m.VPNType = {'VPNType_6.png', 6, 130, 260, 600, 20000000}
m.targetVPNType = {'targetVPNType_6.png', 515, 130, 743, 480, 10000000}
m.backAddVPNConfig = {'backAddVPNConfig_6.png', 1, 30, 340, 130, 20000000}
m.VPNTypeTitle = {'VPNTypeTitle_6.png', 145, 30, 635, 130, 20000000}
m.L2TPType = {'L2TPType_6.png', 6, 150, 350, 680, 20000000}
m.backToVPN = {'backToVPN_6.png', 1, 30, 340, 130, 20000000}
m.delVPN = {'delVPN_6.png', 170, 420, 630, 990, 20000000}
m.delVPNConfirm = {'delVPNConfirm_6.png',  115, 360, 630, 900, 20000000}
m.delVPNConfirm2 = {'delVPNConfirm_10_6.png', 115, 360, 630, 900, 20000000}
m.delVPNBlueBtn = {'delVPNBlueBtn_6.png', 115, 360, 630, 900, 20000000}
m.disconnectVPNBtn = {'disconnectVPNBtn_6.png', 470, 130, 744, 600, 20000000}
m.vpnVerifyFail = {'vpnVerifyFail_6.png', 130, 330, 595, 792, 20000000}
m.vpnAccountInput = {'vpnAccountInput_6.png', 5, 335, 240, 820, 20000000}
m.connectVPNFail = {'VPNConnectFail_6.png', 130, 330, 595, 792, 20000000}

m.appRemoveBtn = {'appRemoveBtn_6.png', 21, 28, 707, 1107, 20000000}
m.ppWhiteIcon = {'ppWhiteIcon_6.png', 21, 28, 707, 1107, 10000000}
m.appRemovePop = {'appRemovePop_6.png', 100, 325, 690, 825, 20000000}

m.deviceNeedActive = {'deviceNeedActive_6.png', 255, 480, 520, 900, 20000000}
m.activeContinue = {'activeContinue_6.png', 240, 420, 510, 590, 20000000}
m.activeDeviceMore = {'activeDeviceMore_6.png', 167, 183, 557, 413, 20000000}

m.downloadYuyihuBtn = {0x479119, "39|3|0xffffff,120|30|0x104b02,139|3|0xffffff,164|17|0x5fa425", 90, 444, 129, 711, 261}

m.mediaServicePop = {'appleMediaProtocal_6.png', 166, 359, 598, 771, 20000000}
m.agreeMeidaService = {0x007aff, "-2|-2|0xf9f9f9,5|6|0x007aff,6|9|0xf9f9f9,7|16|0x007aff,13|21|0x007aff,17|28|0xf9f9f9,20|28|0x007aff,58|23|0x007aff,58|27|0xf9f9f9", 90, 613, 39, 747, 129, '媒体服务同意'}
m.agreeMeidaServicePop = {0x007aff, "-2|-2|0xf8f8f8,5|6|0x007aff,6|9|0xf8f8f8,7|16|0x007aff,11|17|0xf8f8f8,11|21|0x007aff,20|28|0x007aff,17|28|0xf8f8f8,61|25|0x007aff", 90, 120, 644, 651, 909, '同意媒体服务弹窗'}
m.allowBtn = {0x007aff, "1|-2|0xf9f9f9,-9|11|0x007aff,-12|11|0xf9f9f9,9|4|0x007aff,14|13|0x007aff,15|16|0xf9f9f9,16|22|0x007aff,36|7|0x007aff,36|11|0xf9f9f9", 90, 367, 644, 646, 886, '允许'}
m.safeMode = {0x555555, "3|3|0xffffff,7|3|0x555555,7|0|0xffffff,7|7|0xffffff,8|11|0x555555,54|2|0xffffff,58|2|0x555555,172|9|0xffffff,172|11|0x555555", 90, 255, 0, 498, 44, 'Exit Safe Mode'}
m.restartSb = {0x007aff, "3|3|0xdbdbdb,12|2|0x007aff,14|21|0x007aff,10|21|0xdbdbdb,100|1|0x007aff,103|1|0xd9dcda,103|6|0x007aff,107|6|0xd9dcda,104|21|0x007aff", 90, 154, 798, 610, 1094, 'Restart'}
m.backSetting = {0x007aff, "-6|14|0xf5f5f7,-11|14|0x007aff,5|32|0x007aff,30|4|0x057cff,29|7|0xf5f5f7,28|10|0x007aff,77|23|0x007aff,77|25|0xf5f5f7,85|27|0x007aff", 90, 8, 40, 156, 124,'返回设置页'}





m.wangguoGet = {0xe9fefc, "0|-3|0x654566,0|-6|0xe9fefc,18|5|0x644465,13|9|0xeafefb,55|10|0xe9fefc,56|15|0x654565,56|21|0xeafefb,60|28|0xeafefb,63|31|0x654566", 90, 588, 537, 739, 659,'王国纪元Get'}
m.wangguoinstall = {0x19ab20, "0|-2|0x654566,0|10|0x19ab20,0|14|0x654566,2|17|0x19ab20,18|2|0x19ab20,18|5|0x654566,24|7|0x19ab20,36|16|0x19ab20,38|19|0x654566", 90, 602, 528, 744, 666,'王国纪元安装'}
m.wangguoOpen = {0xe9fefc, "0|-2|0x654566,0|9|0xe9fefc,3|9|0x654566,19|13|0xe9fefc,22|13|0x654566,50|19|0xe9fefc,50|24|0x654566,55|30|0xe9fefc,55|33|0x654566", 90, 609, 555, 742, 657,'王国纪元打开'}
m.wangguoLoading = {0xe7fcfa, "0|2|0x654566,1|2|0xe9fefc,0|3|0x654566,0|4|0x654566,1|4|0xe9fefc,1|6|0x654566,-23|15|0xe9fefc,1|30|0xe9fefc,1|34|0x654566", 90, 646, 552, 743, 658,'正在下载'}
m.wangguoyun = {0xb2a2b3, "0|4|0x654566,-7|7|0xb2a2b3,-18|13|0xb2a2b3,-14|13|0x654566,1|15|0x654566,1|18|0xe9fefc,-6|41|0xe9fefc,-3|41|0x654566,7|41|0xe9fefc", 90, 647, 341, 736, 434,'王国纪元云'}

local Iphone6Interface = {}
function Iphone6Interface: hasPopWind()
	return done(m.灰,'有弹窗') or f_pic(m.gray2)
end

function Iphone6Interface.findBlueTipsBtn()
	return f_pic(m.蓝色提示,'蓝色提示')
end

function Iphone6Interface.clickBlueTipsBtn(...)
	-- body
	return c_pic(m.蓝色提示,'蓝色提示')
end

function Iphone6Interface.findSetting()
	return f_tu(m.preferences) or f_pic(m.preferencespic)
end

function Iphone6Interface.findAppStoreIcon()
	return f_tu(m.loginPage)
end
	
function Iphone6Interface.clickAppStoreIcon()
	return c_tu(m.loginPage)
end

function Iphone6Interface.moveToAppStoreIcon()
	moveTo(500,300,500,150,20)
end

function Iphone6Interface: findITunesAndApp()
	-- body
	return f_tu(m.iTunes与App) or f_tu(m.App与iTunes) or f_tu(m.iTunes与App_2)
end

function Iphone6Interface:findAppleId()
	return f_tu(m.AppleID)
end

function Iphone6Interface: clickAppleId()
	-- body
	return c_tu(m.AppleID)
end

function Iphone6Interface: findLoginBtnGrey()
	-- body
	return f_tu(m.登录灰) or f_tu(m.正在登录)
end

function Iphone6Interface: clickLoginBtnBlue()
	-- body
	if c_tu(m.登录) then
		tap(54, 241)
		mSleep(1000)
		return true
	end
	return false
end

function Iphone6Interface: findLoginBtnBlue()
	-- body
	return f_tu(m.登录)
end

function Iphone6Interface: findPasswordInput()
	-- body
	return f_tu(m.密码)
end

function Iphone6Interface: clickPasswordInput()
	-- body
	return c_tu(m.密码)
end

function Iphone6Interface.clickReturnKey( )
	click(675, 1290)
end

function Iphone6Interface: clickCancelLoginBtn()
	click(240,575)
end

function Iphone6Interface: findLogoutBtn()
	-- body
	return f_tu(m.注销) or f_tu(m.注销2)
end

function Iphone6Interface: clickLogoutBtn()
	-- body
	return c_tu(m.注销) or c_tu(m.注销2)
end

function Iphone6Interface.findNeedAppleIdLogin( )
	return f_tu(m.needAppleIdLogin_9) or f_tu(m.needAppleIdLogin_10)
end

function Iphone6Interface: clickLoginBtn()
	if not c_tu(m.登录按钮) then
		click(500,570) 
	end
	return true
end

function Iphone6Interface.findWrongAppleIdZone( )
	return f_tu(m.wrongAppleIdZone)
end

function Iphone6Interface: clickCancelBtn()
	-- body
	return c_tu(m.取消) or c_tu(m.commonCancel)
end

function Iphone6Interface: findLoginITunesWin()
	-- body
	return f_tu(m.登录iTunes) or f_tu(m.登录iTunes2)
end

function Iphone6Interface.clickLoginITunesWin(otherType)
	-- body
	click(500,605)

	if otherType == 1 then                
		click(370,80)
		writeASOLog('点击搜索框')
	end
end

function Iphone6Interface：find15MinutesPassword()
	-- body
	return f_tu(m.十五分需要)
end

function Iphone6Interface：find15MinutesPasswordTop()
	return f_tu(m.十五分需要_top)
end

function Iphone6Interface: findSavePassword()
	-- body
	return f_tu(m.保存密码,'保存密码')
end

function Iphone6Interface: findSavePasswordTop()
	-- body
	return  false -- to-do f_pic(m.保存密码_top,'保存密码_top')
end

function Iphone6Interface: findCantConnectITunes()
	-- body
	return f_tu(m.无法连接到) or f_tu(m.无法连接到2)
end

function Iphone6Interface: findCantConnectITunesTop(...)
	-- body
	return  false -- to-do：f_tu(m.无法连接到_top)
end

function Iphone6Interface.findCantAppStore( )
	-- body
	return f_tu(m.cantAppStore_2) --f_tu(m.无法连接AppStore) or 
end

function Iphone6Interface: clickSearchBtnBottomGrey()
	if not f_tu(m.搜索blue,'搜索-blue') and not f_pic(m.blueSearch) then
		return c_tu(m.搜索, '搜索')
	end
end
function Iphone6Interface: findSearchBtnBottomGrey()
	return f_tu(m.搜索, '搜索')
end

function Iphone6Interface:findSearchBtnBottomBlue()
	return f_tu(m.搜索blue,'搜索-blue') or f_pic(m.blueSearch)
end


function Iphone6Interface.findSearchTop()
	return f_tu(m['top-搜索'])
	-- body
end

function Iphone6Interface.clickSearchTop()
	return c_tu(m['top-搜索'])
	-- body
end

function Iphone6Interface.clickBlank()
	-- body
	return c_tu(m['空格']) or c_tu(m['空格_us'])
end

function Iphone6Interface.clickSearchBtn()
	c_tu(m.confirmKey)
	delay(0.5)
	return c_tu(m['搜']) or c_tu(m.中文搜索)
end

function Iphone6Interface.findSearchBack( )
	return f_tu(m.searchBack)
end

function Iphone6Interface.findSearchResult()
	-- body
	return f_tu(m.获取) or f_tu(m.云) or f_pic(m.新云) or f_tu(m.打开) or f_pic(m.open2) or f_pic(m.open3) or f_tu(m.更新) or f_tu(m.安装) or f_tu(m.正在下载) or f_tu(m.正在下载_all)
end

function Iphone6Interface.findCloud()
	return f_tu(m.云) or f_pic(m.新云) or f_pic(m.wangguoyun)
end

function Iphone6Interface.clickCloud()
	return c_tu(m.云) or c_pic(m.新云) or c_pic(m.wangguoyun)
end

function Iphone6Interface.findOpenOrUpdate()
	return f_tu(m.打开) or f_tu(m.更新) or f_pic(m.open2) or f_pic(m.open3) or f_pic(m.wangguoOpen)
end

function Iphone6Interface.findQude()
    return f_pic(m.取得)
end

function Iphone6Interface.findHanwen( )
	return f_pic(m.hanwen2)
end

function Iphone6Interface.hasSearchBlueRect()
	return f_pic(m.searchBlueRect)
end

function Iphone6Interface.clickOpen()
	-- body
	return c_tu(m.打开) or c_pic(m.open2)
end

function Iphone6Interface.clickGetBtn()
	return c_tu(m.获取) or c_pic(m.wangguoGet)
end

function Iphone6Interface.clickInstallBtn()
	return c_tu(m.安装) or c_pic(m.wangguoinstall)
end

function Iphone6Interface.findGetBtn()
	return f_tu(m.获取) or f_pic(m.wangguoGet)
end

function Iphone6Interface.findInstallBtn()
	return f_tu(m.安装) or f_pic(m.wangguoinstall)
end

function Iphone6Interface.findLoginInAppStore( )
	return f_tu(m.loginInAppStore)
end

function Iphone6Interface.findDownLoadingApp()
	return f_tu(m.正在下载) or f_tu(m.正在下载_all) or f_pic(m.wangguoLoading)
end

function Iphone6Interface.cancelDownloading()
	return c_tu(m.正在下载) or c_tu(m.正在下载_all)
end

function Iphone6Interface.clickClearSearchBarBtn()
	click(370,80)
	writeASOLog('点击搜索框')
	delay(0.5)
	click(703,83)
	writeASOLog('点叉')
	delay(0.5)
	-- click(360,360)
	-- writeASOLog('点击灰色')
end

function Iphone6Interface.clickSearchedApp()
	-- body
	click(345,200)
end

function Iphone6Interface.clickCancelBtnBottom()
	return c_tu(m.cancelBtnBottom)
end

function Iphone6Interface.clickCompleteRightTop()
	return c_tu(m.completeBtnRightUp)
end

local appStoreBar = {{75,1275},{220,1275},{375,1275}}
function Iphone6Interface.clickAppstoreBar(i)
	-- body
	click(appStoreBar[i][1], appStoreBar[i][2])
end

function Iphone6Interface.findDownNull()
	return f_tu(m.download_null)
end

function Iphone6Interface.findBriefValidation()
	return f_tu(m.briefValidation) or f_tu(m.briefValidation2) or f_tu(m.briefValidation3)
end

function Iphone6Interface.findNeedValidation(  )
	return f_tu(m.needValidation) or f_tu(m.needValidation2)
end

function Iphone6Interface.clickCommentBtnWhite()
	return c_tu(m.commentBtnWhite)
end

function Iphone6Interface.findCommentBtnGrey()
	return f_tu(m.commentBtnGrey)
end

function Iphone6Interface.clickWriteCommentBtn()
	return c_tu(m.writeCommentBtn)
end

function Iphone6Interface.findWriteCommentTitle()
	return f_tu(m.writeCommentTitle)
end

function Iphone6Interface.findEmptyStars() 
	return f_tu(m.commentStars)
end

function Iphone6Interface.selectCommentStars()
	click(512, 157)
end

function Iphone6Interface.clickNickName()
	return c_tu(m.createNickName)
end

function Iphone6Interface.clickCommentTitle()
	return c_tu(m.commentTitle)
end

function Iphone6Interface.clickCommentContent()
	return c_tu(m.commentContent)
end

function Iphone6Interface.clickCommentSendBtn()
	return c_tu(m.commentSendBtn)
end

function Iphone6Interface.findNickNameOccupied( )
	return f_tu(m.commentNickNameOccupied)
end

function Iphone6Interface.clickOKBtn( )
	-- body
	return c_tu(m.OKBtn)
end

function Iphone6Interface.findCommentNeedPurchase( )
	return c_tu(m.commentNeedPurchase)
end

function Iphone6Interface.clickLeftUpCancel()
	return c_tu({'cancel_6_2.png', 1, 36, 166, 128, 20000000}) or click(44, 80)
end

function Iphone6Interface.clickIdentifyingCodeIput()
	return c_tu(m.identifyingCodeIput)
end

function Iphone6Interface.findIdentifyingCodeIput()
	return f_tu(m.identifyingCodeIput)
end

function Iphone6Interface.findConfirmPayInfo()
	return f_tu(m.confirmPayInfo) or f_tu(m.confirmPayInfo2)
end

function Iphone6Interface.findIdentifyingCode()
	return f_pic(m.identifyingCode_3,'上面的验证码') or f_pic(m.identifyingCode, '验证码')
end

function Iphone6Interface.getIdentifyingCodeScope()
	if f_pic(m.identifyingCode_3, '上方验证码') then
		return m.identifyingCode_3
	elseif f_pic(m.identifyingCode_down,'验证码下半部分') then
		return m.identifyingCode_10
	else
		return m.identifyingCode
	end
end

function Iphone6Interface.clickNewCheckcode( )
	return c_tu(m.refreshCheckoutCode)
end

function Iphone6Interface.findAccountSetting()
	return f_tu(m.accountSetting) or f_tu(m.accountSetting2)
end

function Iphone6Interface.findTableNoFull()
	return f_tu(m.tableNoFull) or f_tu(m.tableNoFull2)
end

function Iphone6Interface.findTableNoFullAlert()
	return f_pic(m.tableNoFull3,'红色提示_缺少信息')
end

function Iphone6Interface.clickRequestTimeout( )
	if f_tu(m.requestTimeout) then
		if not c_tu(m.haoBtn) then
			click(370, 725)
		end
		return true
	else
		return false
	end
end

function Iphone6Interface.findCantDownload( )
	return f_tu(m.cantDownloadApp)
end

function Iphone6Interface.findNeedActivePop( )
	return f_tu(m.deviceNeedActive)
end

function Iphone6Interface.activeDevice( )
	writeASOLog('activeDevice')
	local function unlockAndPressHome( )
		unlockMyDevice()
		delay(1)
		--按home键
		pressHomeKey(0)
		mSleep(200)
		pressHomeKey(1)
	end
	unlockAndPressHome()
	local startTime = os.time()
	while true do
		if 'com.apple.purplebuddy' == frontAppBid() then
			if Iphone6Interface.findNeedActivePop() then --关闭弹窗
				writeASOLog('need active pop')
				if not Iphone6Interface.clickBlueTipsBtn() then
					click(370, 725)
				end
				mSleep(500)
				unlockAndPressHome()
			elseif c_tu(m.activeContinue) or f_tu(m.activeDeviceMore) then
				writeASOLog('click continue')
				click(372, 510)
				startTime = os.time()
				mSleep(500)
			else
				writeASOLog('waiting ... ')
				click(372, 510)
				mSleep(500)
			end
		else
			return 0
		end
		if os.time() - startTime > 180 then
			return 4010
		end
	end
end

function Iphone6Interface.exitSafeMode()
	local endTime = os.time() + 30
	while os.time() < endTime do
		if c_pic(m.restartSb) then
			delay(15)
			unlockMyDevice()
			return true
		elseif c_pic(m.safeMode) or c_pic(m.蓝色提示) then
		else
			delay(0.5)
		end
	end
end

function Iphone6Interface.otherPopWind(password, stepName)
	writeASOLog('Iphone6Interface.otherPopWind')
	local errorCode = 0
	if 'com.apple.purplebuddy' == frontAppBid() then
		return Iphone6Interface.activeDevice()
	end

	if f_tu(m.needLogin) then
		if password and 'PurchaseApp' == stepName then
			writeASOLog('需要密码')
			local pwdInput = {0xffffff, "1|-23|0x002231,179|-15|0x311290,172|-23|0x221290,177|23|0xffffff,179|23|0x514190,159|26|0x513190,158|23|0xffffff,22|26|0x514151", 90, 377, 453, 654, 877}
			c_pic(pwdInput)
			input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
			input(password)
			writeASOLog('点击获取')
			click(510,580)
		else
			c_pic(m.蓝色提示,'蓝色提示')
		end
		delay(2)
	elseif f_tu(m.十五分需要) then
		writeASOLog('十五分钟需要')
		click(500,780)
	elseif f_tu(m.十五分需要_top) then
		writeASOLog('十五分需要_top')
		click(500,570)
		-- if otherType == 1 then                
		-- 	click(370,80)
		-- 	writeASOLog('点击搜索框')
		-- end
	elseif f_tu(m.保存密码,'保存密码') then
		writeASOLog('保存密码')
		click(240,765)
--	elseif f_pic(m.保存密码_top,'保存密码_top') then
--		writeASOLog('保存密码_top 点击取消')
--		click(450,410)
	elseif f_tu(m.无法连接到) or f_tu(m.无法连接到2) then
		writeASOLog('无法连接到itunes')
		if 'LoginAppleAccount' ~= stepName then
			errorCode = 1015
			snapshotScreen(errorCode)
		end
		click(330,720)
--	elseif f_tu(m.无法连接到_top) then
--		writeASOLog('无法连接iTunes_键盘')
--		click(415,370)
--		--恢复页面
--		click(311,81)
--		writeASOLog('点击搜索框')
--		delay(0.5)
--		click(592,83)
--		writeASOLog('点叉')
--		click(421,249)
--		writeASOLog('点击灰色')
--		errorCode = 1015
--	elseif f_tu(m.无法购买) then
--		writeASOLog('无法购买')
--		click(322,628)
--	elseif f_tu(m.无法购买_top) then
--		writeASOLog('无法购买top')
--		click(320, 375)
	elseif f_tu(m.选择wifi) then
		writeASOLog('选择wifi')
		click(370,925)
	elseif f_tu(m.选择wifi_top) then                  --这里需要再验证   偏移值计算252  
		writeASOLog('选择wifi_top')
		click(370,665)   
		-- if otherType == 1 then                
		-- 	 click(370,80)
		-- 	writeASOLog('点击搜索框')
		-- end
--	elseif f_pic(m.立即下载,'立即下载')then
--		writeASOLog('立即下载')
--		click(321,668)
--	elseif f_pic(m.不再另外收费,'不再另外收费')then
--		writeASOLog('不再另外收费')
--		click(322,650)
--	elseif f_tu(m.验证失败_top) then
--		writeASOLog('验证失败_top')
--		click(431,428)
	elseif f_tu(m.appleIdNotActived) or f_tu(m.appleIdNotActivedE) then
		errorCode = 1098
		snapshotScreen(errorCode)
	elseif f_tu(m.appleIdNeedShortMsg) then --'PurchaseApp' == stepName and
		errorCode = 1097
		snapshotScreen(errorCode)
	elseif f_tu(m.验证失败) or f_tu(m.验证失败2) then
		writeASOLog('验证失败')
		if f_pic(m.appIdLock) then
			return 1024
		end
		if 'LoginAppleAccount' == stepName then
			local snapFile = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_verifyFail.png'
			snapshot(snapFile)
			-- uploadError(snapFile)
		end
		if c_tu(m.commonCancel) then
			writeASOLog('点取消')
		elseif c_tu(m.haoBtn) then
			writeASOLog('点图haobtn')
		else
			c_pic(m.蓝色提示,'蓝色提示')
			writeASOLog('验证失败_蓝色提示按钮')
		end
--	elseif f_tu(m.中国Store) then
--		writeASOLog('只能在中国Store')
--		click(320,690)
--		closeApp(AppStore)
--		delay(1)
--		openURL("prefs:root=STORE")
--		delay(1)
--	elseif f_tu(m.验证AppleID) then
--		writeASOLog('验证AppleID')
--		click(180,677)
--	elseif f_tu(m.编辑主屏幕) then
--		writeASOLog('编辑主屏幕')
--		click(317,711)
--	elseif f_pic(m.验证失败,'验证失败') then
--		writeASOLog('验证失败')
--		click(321,652)
--	elseif f_pic(m.验证失败2,'验证失败2') then
--		writeASOLog('验证失败2,')
--		click(453,651)
--	elseif f_pic(m.无法下载项目,'无法下载项目')then
--		writeASOLog('无法下载项目')
--		click(191,651)
--	elseif f_tu(m.无法下载项目_top) then
--		writeASOLog('无法下载项目_top')
--		click(180,400)
--	elseif f_pic(m.自动下载,'自动下载')then
--		writeASOLog('自动下载')
--		click(178,684)
	elseif f_tu(m.appleIdNoChecked) or f_tu(m.appleIdNoChecked2) then
		writeASOLog('此AppleID尚未在iTunesStore使用过')
		errorCode = 1023
		snapshotScreen(errorCode)
		if Iphone6Interface.clickCancelBtn() then
			writeASOLog('点取消')
		else
			c_pic(m.蓝色提示,'蓝色提示')
			writeASOLog('appleIdNoChecked_点击蓝色按钮')
		end
	elseif f_tu(m.unCheckAppleID) then
		writeASOLog('账号未检查')
		errorCode = 1023
		snapshotScreen(errorCode)
		Iphone6Interface.clickCancelBtn()
	elseif f_tu(m.moreError) or f_tu(m.moreError2) then
		writeASOLog('输入错误次数过多')
		errorCode = 1029
		snapshotScreen(errorCode)
		if c_tu(m.haoBtn) then
			writeASOLog('点图haobtn')
		else
			c_pic(m.蓝色提示,'蓝色提示')
			writeASOLog('moreError_蓝色提示按钮')
		end
	elseif f_tu(m.protocolChange) then
		writeASOLog('协议更改')
		click(500,790)
	elseif f_tu(m.protocolArgee_2) or f_tu(m.protocolArgee) then
		writeASOLog('同意协议')
		click(500,740)
--	elseif done(m['需要验证'],'需要验证')then
--		writeASOLog('需要验证')
--		click(446,665)
		----------------------------------------帐号封号处理-------------------------------------
	elseif f_tu(m.锁定,'锁定') or f_tu(m.appleIdLocked) or f_pic(m.billError) or f_pic(m.doubleVerify) then --or f_tu(m.验证AppleID)
		writeASOLog('账号锁定')
		errorCode = 1024
		snapshotScreen(errorCode)
		click(510,765)
	elseif f_tu(m.禁用2) then -- or f_pic(m.禁用,'禁用')
		writeASOLog('账号禁用')
		errorCode = 1021
		snapshotScreen(errorCode)
		click(374,740)
	 elseif f_tu(m.停用) or f_tu(m.停用2) then
		writeASOLog('账号停用')
		errorCode = 1022
		snapshotScreen(errorCode)
		click(370,725)
--	elseif done(m.unbale,'unbale')then
--		writeASOLog('unbale')
--		click(299,697)
	elseif f_tu(m.cant_purchase) then
		writeASOLog('无法购买')
		if 'PurchaseApp' == stepName then
			errorCode = 1009
			snapshotScreen(errorCode)
		end
		if c_tu(m.haoBtn) then
			writeASOLog('点图haobtn')
		else
			c_pic(m.蓝色提示,'蓝色提示')
			writeASOLog('cant_purchase_蓝色提示按钮')
		end
	elseif f_tu(m.cant_download) then
		writeASOLog('无法下载')
		local btn1 = m.retryBtn
		local btn2 = m.completeBtn
		if 'LoginAppleAccount' == stepName then
			btn1 = m.completeBtn
			btn2 = m.retryBtn
		end
		if c_tu(btn1) then
			writeASOLog('点' .. btn1[1])
		elseif c_tu(btn2) then
			writeASOLog('点' .. btn2[1])
		elseif c_tu(m.haoBtn) then
			writeASOLog('点好')
		else
			c_pic(m.蓝色提示,'蓝色提示')
			writeASOLog('cant_download_蓝色提示按钮')
		end
	elseif f_tu(m.briefValidation) or f_tu(m.briefValidation2) then
		writeASOLog('需要一个简短的验证')
		if c_tu(m.commonCancel) then
			writeASOLog('点取消')
		else
			writeASOLog('点击蓝色按钮')
			c_pic(m.蓝色提示,'briefValidation_蓝色提示')
		end
	elseif f_tu(m.confirmPayInfo) or f_tu(m.confirmPayInfo2) then
	 	writeASOLog('需要验证付款信息')
		if c_tu(m.commonCancel) then
			writeASOLog('点取消')
		else
			writeASOLog('点击蓝色按钮')
			c_pic(m.蓝色提示,'confirmPayInfo_蓝色提示')
		end
	elseif f_tu(m.tableNoFull) or f_tu(m.tableNoFull2) then
		writeASOLog('表格填写不完整')
		errorCode = 1028
		snapshotScreen(errorCode)
		if c_tu(m.haoBtn) then
			writeASOLog('点好')
		else
			writeASOLog('点击蓝色按钮')
			c_pic(m.蓝色提示,'tableNoFull_蓝色提示')
		end
	elseif f_tu(m.updateAppFree) then
		writeASOLog('更新免费')
		if c_tu(m.haoBtn) then
			writeASOLog('点好')
		else
			click(508, 790)
		end
	elseif f_pic(m.useLocationBG) and c_tu(m.continueBtn) then
		writeASOLog('继续后台使用位置')
	elseif f_pic(m.hanwen) or f_tu(m.accountNotInThisStore) then
		writeASOLog('韩文好的')
		errorCode = 1032
	elseif f_tu(m.mediaServicePop) then
		if not c_tu(m.haoBtn) then
			click(504, 780)
			mSleep(1000)
		end
	elseif c_pic(m.agreeMeidaServicePop) then
	elseif f_pic(m.safeMode) or f_pic(m.restartSb) then
		if not Iphone6Interface.exitSafeMode() then
			writeASOLog('设备进入安全模式')
		end
	elseif f_pic(m.cantVerifyServer) then
		if not Iphone6Interface.clickCancelBtn() then
			click(377, 850)
			mSleep(1000)
		end
		----------------------------------------帐号封号处理-------------------------------------
	elseif f_pic(m.蓝色提示,'蓝色提示')then
		-- if 'PurchaseApp' == stepName then
		-- 	local snapFile = g_config.log_path .. DEVICE_INFO.type .. '_' .. DEVICE_INFO.deviceID .. '_blue.png'
		-- 	snapshot(snapFile)
		-- 	uploadError(snapFile)
		-- end
		writeASOLog('有弹窗 蓝色提示')
		c_pic(m.蓝色提示,'蓝色提示')
	end
	return errorCode
end

function Iphone6Interface.xieyiProcess()
	writeASOLog('Iphone6Interface.xieyiProcess')
	if 'com.apple.purplebuddy' == frontAppBid() then
		return Iphone6Interface.activeDevice()
	elseif f_tu(m.protocoliTunes) then
		writeASOLog('协议iTunes')
		if f_tu(m.protocolDone) then
			writeASOLog('协议完成')
			c_tu(m.protocolDone)
			delay(1)
			if frontAppBid() == g_config.appStore then           --如果前台是STROE
                closeApp( g_config.appStore)
            end
			openURL("prefs:root=STORE")
		else
			writeASOLog('点协议同意 700 1290')
			click(700,1290)
		end
	elseif f_tu(m.accountSetting) then
		writeASOLog('账户设置')
        if c_tu(m.whitout) then
			writeASOLog('点无')
			delay(1)
		end
		if c_tu(m.completeBtnRightUp) then
			writeASOLog('点完成按钮')							-- 点击 账户设置完成
		end
	elseif Iphone6Interface.clickCompleteRightTop() then
		writeASOLog('点右上角完成按钮')
	elseif c_pic(m.agreeMeidaService) then
		for i=1,10 do
			if c_pic(m.agreeMeidaServicePop) then
				break;
			else
				delay(1)
			end
		end
	end
	return 0
end

function Iphone6Interface.tryPlay(appId, appBid, taskType, accountInfo, isBigScreen, isNeedReg, clickType, adid)
	local playFuncKey = g_config.testPlayScript[appId] and (DEVICE_INFO.type .. '_' .. appId) or (DEVICE_INFO.type .. '_testPlayDefault')
	return Iphone6Interface[playFuncKey](appBid, taskType, accountInfo, isBigScreen, isNeedReg, clickType, adid)
end

function Iphone6Interface.findVPNTitle()
	-- return f_tu(m.VPNTitle)
	return f_pic(m.VPNTitlepic) or f_tu(m.VPNTitle)
end

function Iphone6Interface.findGeneralTitle( )
	return f_tu(m.generalTitle) or f_pic(m.generalTitlepic)
end

function Iphone6Interface.clickGeneralBtn( )
	return c_tu(m.generalBtn) or c_pic(m.generalBtnpic)
end

function Iphone6Interface.clickVPNSettingItem( )
	return c_tu(m.vpnSettingItem) or c_pic(m.vpnSettingItempic)
end

function Iphone6Interface.findVPNEditBtn( )
	return f_tu(m.VPNConfigEditBtn)
end

function Iphone6Interface.clickVPNEditBtn( )
	return f_tu(m.VPNConfigEditBtn)
end
function Iphone6Interface.backtoSetting( )
	return c_pic(m.backSetting)
end
-- function Iphone6Interface.findBackToVPN( )
-- 	return f_tu(m.)
-- end

function Iphone6Interface.findAddConfigTitle()
	return f_tu(m.addVPNConfigTitle)
end

function Iphone6Interface.clickAddVPNCofig( )
	return c_tu(m.addVPNConfig) or c_tu(m.addVPNConfig2)
end

function Iphone6Interface.findTargetVPNType( )
	return f_tu(m.targetVPNType)
end

function Iphone6Interface.clickVPNType(  )
	return c_tu(m.VPNType)
end

function Iphone6Interface.clickVPNL2TP( )
	return c_tu(m.L2TPType)
end

function Iphone6Interface.clickBackAddVPNConfig( )
	return c_tu(m.backAddVPNConfig)
end

function Iphone6Interface.findTargetVPNConfig( )
	return f_tu(m.targetVPNConfig)
end

function Iphone6Interface.clickVPNDesc( )
	return c_tu(m.VPNDesc)
end

function Iphone6Interface.findSelectedTargetVPNConfig( )
	return f_tu(m.selectedTargetVPNConfig)
end

function Iphone6Interface.findConnectedState( )
	return f_tu(m.VPNConnected)
end

function Iphone6Interface.clickConnectVPNBtn( )
	return c_tu(m.VPNConnectBtn)
end

function Iphone6Interface.clickTargetVPNConfig( )
	return c_tu(m.targetVPNConfig)
end

function Iphone6Interface.clickDelVPN()
	return c_tu(m.delVPN)
end

function Iphone6Interface.findDelVPNConfirm(  )
	return f_tu(m.delVPNConfirm) or f_tu(m.delVPNConfirm2)
end

function Iphone6Interface.clickDelVPNBlueBtn( )
	return c_tu(m.delVPNBlueBtn)
end

function Iphone6Interface.clickTargetVPNEditBtn( )
	local t = m.targetVPNConfig
	local x, y = findImage(t[1],t[2],t[3],t[4],t[5],t[6])
	if -1 ~= x and -1 ~= y then
		click(697, y + 30)
		return true
	end
	return false
end

function Iphone6Interface.findConnectVPNFail(  )
	return f_tu(m.connectVPNFail)
end

function Iphone6Interface.clickInputVPNPassword( )
	return false
end

function Iphone6Interface.disconnectVPN()
	if not c_tu(m.disconnectVPNBtn) then
		click(680, 280)
	end
end

function Iphone6Interface.findVpnVerifyFail( )
	return f_tu(m.vpnVerifyFail)
end

function Iphone6Interface.clickVpnAccountInput(  )
	return c_tu(m.vpnAccountInput)
end

function Iphone6Interface.clickOpenInAppStore( )
	return c_tu(m.openInAppStore)
end

function Iphone6Interface.clickDownloadYuyihuBtn( )
	return c_pic(m.downloadYuyihuBtn, '羽衣狐下载')
end
--[[
	AppleId 密码设置
--]]
function Iphone6Interface.findNeedPwd()
	return f_pic(m.needPwd)
end

function Iphone6Interface.clickNeedPwdBtn()
	return c_pic(m.needPwdBtn)
end

function Iphone6Interface.clickPasswordSetting()
	return c_pic(m.passwordSetting)
end

function Iphone6Interface.clickNeedPwdIn15Min()
	return c_pic(m.needPwdIn15Min)
end

return Iphone6Interface

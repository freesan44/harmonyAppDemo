import http from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';
import image from '@ohos.multimedia.image';
export default struct LeftIndex extends  {
    constructor() { }
    build() {
        ;
    }
    topPic() {
        // Image($r('app.media.ic_tab_cloud_default'))
        //   .width('100%')
        //   .height(200)
        //   .onClick(()=>{
        //     this.getImage('https://ebankcdn.gdrcu.com/liebao-bucket/lijimiantiao_1223.jpg')
        //   })
            .width('100%')
            .height(300);
    }
    getImage(url) {
        let httpRequest = http.createHttp();
        httpRequest.request(url, (err, data) => {
            if (err) {
                console.log(err.toString());
            }
            else {
                let code = data.responseCode;
                if (code == ResponseCode.ResponseCode.OK) {
                    let res = data.result;
                    let imageSource = image.createImageSource(res);
                }
            }
        });
    }
}
//# sourceMappingURL=LeftIndex.js.map
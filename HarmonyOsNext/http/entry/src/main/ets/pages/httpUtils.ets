// HttpUtil.ets
import { http } from '@kit.NetworkKit';
import ResponseResult from './requestResult';


export function httpRequestGet(url: string): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let requestResupt = httpRequest.request(url,{
    method:http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    },
  })

  let serverData: ResponseResult = new ResponseResult();

  return requestResupt.then((value: http.HttpResponse) => {
    if (value.responseCode === 200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      serverData.data = resultJson.data;
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `oh no`;
    }
    return serverData;
  }).catch((err:http.HttpResponse) => {
    serverData.msg = 'fuck'
    serverData.data = err
    return serverData;
  })
}
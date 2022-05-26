# flybirds-test




录屏中的字体显示
https://www.zhihu.com/question/19911793

sudo apt-get install ttf-wqy-microhei  #文泉驿-微米黑
sudo apt-get install ttf-wqy-zenhei  #文泉驿-正黑
sudo apt-get install xfonts-wqy #文泉驿-点阵宋体



1.录屏清晰程度

使用playwright自带的track


2.代理的设置


3.插件的设置


https://github.com/microsoft/playwright/issues/7297

如果没法自动加载，那就模拟人的安装动作，定位到setting 进入addon，搜索xxxx，点击，addto一系列步骤

4.使用交互行为录制文本描述
进一步降低非开发人员的上手成本
在web端可以实现一次录制 多次调用

https://github.com/DeploySentinel/Recorder
https://github.com/checkly/headless-recorder

比如在验证码的环节就很有用

问题是移动端怎么做？


5. 用户指纹
undetected

6. 如何调用外部模块

比如定位到验证码，发起调用api的请求，得到结果，完成输入验证




const path = require('path');
const {firefox} = require('playwright');
const webExt = require('web-ext').default;

(async () => {
  // Enable verbose logging and start capturing logs.
  webExt.util.logger.consoleStream.makeVerbose();
  webExt.util.logger.consoleStream.startCapturing();

  // Launch firefox
  const runner = await webExt.cmd.run({
    sourceDir: path.join(__dirname, 'webextension'),
    firefox: firefox.executablePath(),
    args: [`-juggler=1234`],
  }, {
    shouldExitProgram: false,
  });

  // Parse firefox logs and extract juggler endpoint.
  const JUGGLER_MESSAGE = `Juggler listening on`;
  const message = webExt.util.logger.consoleStream.capturedMessages.find(msg => msg.includes(JUGGLER_MESSAGE));
  const wsEndpoint = message.split(JUGGLER_MESSAGE).pop();

  // Connect playwright and start driving browser.
  const browser = await firefox.connect({ wsEndpoint });
  const page = await browser.newPage();
  await page.goto('https://mozilla.org');
  // .... go on driving ....
})();

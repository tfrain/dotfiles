const {
    aceVimMap,
    mapkey,
    imap,
    imapkey,
    getClickableElements,
    vmapkey,
    map,
    unmap,
    vunmap,
    cmap,
    addSearchAlias,
    removeSearchAlias,
    tabOpenLink,
    readText,
    Clipboard,
    Front,
    Hints,
    Visual,
    RUNTIME
} = api;

Front.registerInlineQuery({
    url: function(q) {
        return `http://dict.youdao.com/w/eng/${q}/#keyfrom=dict2.index`;
    },
    parseResult: function(res) {
        var parser = new DOMParser();
        var doc = parser.parseFromString(res.text, "text/html");
        var collinsResult = doc.querySelector("#collinsResult");
        var authTransToggle = doc.querySelector("#authTransToggle");
        var examplesToggle = doc.querySelector("#examplesToggle");
        if (collinsResult) {
            collinsResult.querySelectorAll("div>span.collinsOrder").forEach(function(span) {
                span.nextElementSibling.prepend(span);
            });
            collinsResult.querySelectorAll("div.examples").forEach(function(div) {
                div.innerHTML = div.innerHTML.replace(/<p/gi, "<span").replace(/<\/p>/gi, "</span>");
            });
            var exp = collinsResult.innerHTML;
            return exp;
        } else if (authTransToggle) {
            authTransToggle.querySelector("div.via.ar").remove();
            return authTransToggle.innerHTML;
        } else if (examplesToggle) {
            return examplesToggle.innerHTML;
        }
    }
});

map('gt', 'T');
map('<Ctrl-[>', "<Esc>");
cmap('<Ctrl-[>', "<Esc>");
imap('<Ctrl-[>', "<Esc>");

addSearchAlias(
  'cs',
  'chrome search',
  'https://chrome.google.com/webstore/search/',
  's');

addSearchAlias(
  'lc',
  'linux command search',
  'https://wangchujiang.com/linux-command/list.html#!kw=',
  's');

addSearchAlias(
  'dl',
  'deepL translate',
  'https://www.deepl.com/translator#en/zh/',
  's');

addSearchAlias(
  'ls',
  'gitlab search',
  'https://code.byted.org/?utf8=%E2%9C%93&name=',
  's');

addSearchAlias(
  'o',
  'onelook search',
  'https://onelook.com/?w=',
  's');

addSearchAlias(
  'u',
  'swurl search',
  'https://swurl.com/?q=',
  's');

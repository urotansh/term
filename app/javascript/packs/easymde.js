import 'easymde/dist/easymde.min.css'
import EasyMDE from "easymde";

'ajax:complete turbolinks:load'.split(' ').forEach((eventName)=>{
  document.addEventListener(eventName, (e)=>{
    if (document.getElementById("editor") != null){
    // textareaをMarkdownエディタにする
    const easymde = new EasyMDE({
      // showIcons: ["code", "table"],
      showIcons: ["undo", "redo", "table"],
      shortcuts: {
          "drawTable": "Cmd-Alt-T", // Markdownテーブルショートカット
      },
      renderingConfig: {
          codeSyntaxHighlighting: true,
      },
      sideBySideFullscreen: false,
      spellChecker: false,   // 日本語はスペルチェックに引っかかるのでスペルチェックをオフ
      // autosave: {            // 自動保存
      //     enabled: true,     // 自動保存有効化
      //     delay: 1000,       // 1秒ごと保存
      //     uniqueId: 'mde-autosave-demo' // ローカルストレージのキーに使用
      // },
      element: document.getElementById("editor"),
    });
    easymde.toggleSideBySide();
  };
    if (document.getElementById("editor-preview") != null){
      // textareaをMarkdownエディタにする
      const easymdePreview = new EasyMDE({
        showIcons: [],
        autoDownloadFontAwesome: false,
        toolbar: [{
          name: "fullscreen",
          action: EasyMDE.toggleFullScreen,
          className: "fa fa-arrows-alt no-disable no-mobile",
          title: "Toggle Fullscreen",
        }],
        status: false,
        syncSideBySidePreviewScroll: false,
        scrollbarStyle: null,
        renderingConfig: {
            codeSyntaxHighlighting: true,
        },
        element: document.getElementById("editor-preview"),
      });
      easymdePreview.togglePreview();
    };
  });
});

;; YAOLIUSAN -> YAOLIUYAO -> yao7san


(setq ic/host "imxx.top")
(setq ic/proxy "http://imxx.top:11181" ic/proxy-lighter "   proxy   ")
(setq ic/workdir "d:/dotnet/")

(setq find-program "~/Apps/msys64/usr/bin/find.exe")

(setq ic/eshell-extra-aliases
      `(("epull" ,(format "https_proxy=%s git -C ~/.emacs.d pull --rebase" ic/proxy))))

(setq ic/faces (list
                :frame 'max
                ;;:theme nil
                :theme 'modus-operandi
                :font (cons "Consolas" 160)
                ;;:font-unicode "仿宋"
                ))
(with-over
 (set-locale-environment "zh_CN.GBK")
 (prefer-coding-system 'utf-8)

 (global-set-key "\C-z" 'set-mark-command)
 )

(with-over
 (set-face-attribute 'mode-line nil :height 100 :family "Droid")
 (set-face-attribute 'mode-line-inactive nil :height 100 :family "Droid"))

(setq backup-by-copying nil)
(setq initial-major-mode 'org-mode initial-scratch-message "
  1. 手机放好
  2. 保持安静
  3. 不要睡觉\n\n")

;;(setq-default left-fringe-width 20)


;;; favors

(setq ic/quicker-list
      '(("host: github/freelazy"   "https://github.com/freelazy")
        ("host: notes/freelzy"     "https://freelazy.github.io")))

(with-over
 (defreference sites-1
   "DOCS/ASP.NET: https://learn.microsoft.com/zh-cn/aspnet"
   "Github: https://github.com/freelazy"
   "NuGet: https://www.nuget.org"
   ".NET API: https://learn.microsoft.com/zh-cn/dotnet/api/"
   ".NET Reference Source: https://referencesource.microsoft.com"))


;; Org

(setq org-directory "~/.notes/.src/"
      org-publish-directory "~/.notes/html/"
      org-roam-directory "~/.notes/.src")

(setq org-agenda-notes (append
                        (file-expand-wildcards (expand-file-name "*/*.org" org-directory))
                        (file-expand-wildcards (expand-file-name "*/*/*.org" org-directory))))

(with-over (global-set-key [f8] 'im/note-publish))

(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:dbuser . "sa")
        (:dbpassword . "sa")
        (:dbhost . "localhost")
        (:database . "TeachAssist")))


;; Translate

(with-over
 (require 'go-translate)
 (setq gts-cache-enable nil
       gts-langs '(en zh ja ru fr)
       gts-default-translator
       (gts-translator
        :taker (gts-taker :text 'word)
        :engines (list
                  (gts-bing-engine)
                  ;;(gts-youdao-dict-engine)
                  ;;(gts-google-engine :parser (gts-google-parser))
                  )
        :render (gts-buffer-render :prefix "\n")))

 (global-set-key [f5] 'gts-do-translate)
 (define-key gts-buffer-prompt-map [f5] #'exit-minibuffer)
 (global-hl-line-mode 1))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(plz gptel fuzzy-finder treesit-auto ox-spectacle pcre2el trashed org-reverse-datetree ztree yasnippet yaml-mode xterm-color which-key web-mode web-beautify vundo vlf vertico uuidgen use-package udev-mode typescript-mode systemd syntax-subword sx ssh-agency srcery-theme sql-indent sis sharper session scala-mode sass-mode rust-mode robe rime rg rainbow-mode rainbow-delimiters pyim-basedict pyim powershell poly-org poly-markdown plantuml-mode php-mode page-break-lines package-lint ox-pandoc org-roam-ui org-present org-noter-pdftools org-contrib orderless ob-typescript ob-restclient ob-powershell ob-fsharp nov nhexl-mode nano-theme mpv modus-themes memory-usage markdown-toc marginalia macrostep lua-mode lsp-ui lsp-java license-templates leaf-keywords kubernetes kotlin-mode know-your-http-well keycast json-mode jdecomp hyperbole httprepl htmlize hindent hide-lines haskell-mode gruvbox-theme groovy-mode graphviz-dot-mode go-translate go-mode gnuplot gitignore-templates git-timemachine git-modes forge flycheck evil erlang erc-hl-nicks engine-mode emms emmet-mode embark-consult editorconfig edit-indirect eat dockerfile-mode docker dired-dups delight csv-mode csproj-mode cowsay corfu consult-eglot cmake-mode clojure-mode citre cape c-eldoc blackout bbdb auctex attrap android-mode all-the-icons alchemist aes))
 '(warning-suppress-log-types '(((editorconfig editorconfig--advice-find-file-noselect)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

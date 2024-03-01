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
(setq initial-major-mode 'org-mode initial-scratch-message "自尊 自爱 自觉\n
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

(defun im~note-publish-post-hook (_)
  (let ((default-directory org-directory))
    (im/git-commit-and-push "best_try_and_best_chance")))
(add-hook 'note-publish-post-hook #'im~note-publish-post-hook)

(with-over (global-set-key [f8] 'im/note-publish))

(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:dbuser . "sa")
        (:dbpassword . "sa")
        (:dbhost . "localhost")
        (:database . "TeachAssist")))


;; Translate

(with-over
 (global-hl-line-mode 1)
 (require 'go-translate)
 (global-set-key [f5] 'gts-do-translate)
 (defvar gts-enable-paragraph nil)
 (setq gts-translate-list '(("en" "zh")))
 (setq gts-cache-enable nil)
 (setq gts-default-translator
       (gts-translator
        :splitter (if gts-enable-paragraph (gts-paragraph-splitter))

        :picker
        ;;(gts-noprompt-picker)
        ;;(gts-noprompt-picker :texter (gts-whole-buffer-texter))
        (gts-prompt-picker)
        ;;(gts-prompt-picker :single t)
        ;;(gts-prompt-picker :texter (gts-current-or-selection-texter) :single t)

        :engines
         (lambda ()
           (with-slots (text) gts-default-translator
             (if gts-enable-paragraph
                 (gts-bing-engine)
               (list (gts-bing-engine)
                     ;;(gts-youdao-dict-engine)
                     (gts-google-engine :parser (gts-google-parser))))))
        ;;(list
        ;; (gts-bing-engine)
        ;;(gts-google-engine)
        ;; (gts-google-engine :parser (gts-google-summary-parser))
        ;; (gts-google-rpc-engine)
        ;;(gts-deepl-engine :auth-key "2e20bade-88e9-02f3-169f-ab3c445d7984:fx" :pro nil)

        ;;(gts-google-engine :parser (gts-google-parser))
        ;;(gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
        ;;)

        :render
        (gts-buffer-render)

        ;;(gts-posframe-pop-render)
        ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")

        ;;(gts-posframe-pin-render)
        ;;(gts-posframe-pin-render :position (cons 1200 20) :width 50 :height 18)
        ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")

        ;;(gts-kill-ring-render)
        ))

 (define-key gts-prompt-picker-keymap [f5]
   (lambda () (interactive) (exit-minibuffer)))

 (global-set-key [C-f5]
                 (lambda () (interactive)
                   (setq gts-enable-paragraph (not gts-enable-paragraph))
                   (message "Enable paragraph: %s" (if gts-enable-paragraph "yes" "no"))))
 )



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(fuzzy-finder treesit-auto ox-spectacle pcre2el trashed org-reverse-datetree ztree yasnippet yaml-mode xterm-color which-key web-mode web-beautify vundo vlf vertico uuidgen use-package udev-mode typescript-mode systemd syntax-subword sx ssh-agency srcery-theme sql-indent sis sharper session scala-mode sass-mode rust-mode robe rime rg rainbow-mode rainbow-delimiters pyim-basedict pyim powershell poly-org poly-markdown plantuml-mode php-mode page-break-lines package-lint ox-pandoc org-roam-ui org-present org-noter-pdftools org-contrib orderless ob-typescript ob-restclient ob-powershell ob-fsharp nov nhexl-mode nano-theme mpv modus-themes memory-usage markdown-toc marginalia macrostep lua-mode lsp-ui lsp-java license-templates leaf-keywords kubernetes kotlin-mode know-your-http-well keycast json-mode jdecomp hyperbole httprepl htmlize hindent hide-lines haskell-mode gruvbox-theme groovy-mode graphviz-dot-mode go-translate go-mode gnuplot gitignore-templates git-timemachine git-modes forge flycheck evil erlang erc-hl-nicks engine-mode emms emmet-mode embark-consult editorconfig edit-indirect eat dockerfile-mode docker dired-dups delight csv-mode csproj-mode cowsay corfu consult-eglot cmake-mode clojure-mode citre cape c-eldoc blackout bbdb auctex attrap android-mode all-the-icons alchemist aes))
 '(warning-suppress-log-types '(((editorconfig editorconfig--advice-find-file-noselect)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

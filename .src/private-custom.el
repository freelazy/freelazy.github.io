;; YAOLIUSAN -> YAOLIUYAO -> yao7san

(setq ic/up "imxx.top")

(setq backup-by-copying nil)

(setq initial-major-mode 'org-mode)
(setq initial-scratch-message "无他，唯手熟尔！\n\n")

(setq ic/gnus-mails-reciever
      '((nnimap "tmail"
                (nnimap-address "imap.qq.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnir-search-engine imap)
                (nnmail-expiry-target "nnimap+tmail:Deleted Messages")
                (nnmail-expiry-wait 'immediate)))
      ic/gnus-mails-sender
      `((".*"
         (name "yao7san")
         (address "2132579340@qq.com"))))

(setq ic/faces (list
                :frame 'max
                ;;:theme nil
                :theme 'modus-operandi
                :font (cons "Consolas" 130)
                ;;:font-unicode "思源宋体 CN"
                ))

;;(setq-default left-fringe-width 20)

(setq ic/favorites '(("tasks.org"               "e:/home/notes/.src/111/tasks.org")
                     ("host: Github"            "https://github.com/yaoliuyao")
                     ("host/note: YaoliuYao"    "https://yaoliuyao.github.io")))

(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:dbuser . "sa")
        (:dbpassword . "sa")
        (:dbhost . "localhost")
        (:database . "xxx")))


;; Notes

(setq org-directory "e:/Home/notes.173/.src/"
      note-publish-directory "e:/Home/notes.173/html/"
      org-roam-directory "e:/home/notes.173/.src"
      org-agenda-notes (append
                        (file-expand-wildcards (expand-file-name "*/*.org" org-directory))
                        (file-expand-wildcards (expand-file-name "*/*/*.org" org-directory))))

(with-over
 (global-set-key [f8] 'im/note-publish)
 (defun:hook note-publish-post-hook (_)
   ;; (let ((default-directory note-directory))
   ;;   (im/git-commit-and-push "best_try_and_best_chance"))
   ))


;; Translate

(with-over
 (require 'go-translate)
 (global-set-key [f5] 'gts-do-translate)
 (setq gts-translate-list '(("en" "zh")))
 (setq gts-default-translator
       (gts-translator

        :picker
        ;;(gts-noprompt-picker)
        ;;(gts-noprompt-picker :texter (gts-whole-buffer-texter))

        (gts-prompt-picker)
        ;;(gts-prompt-picker :single t)
        ;;(gts-prompt-picker :texter (gts-current-or-selection-texter) :single t)

        :engines
        (list
         (gts-bing-engine)
         ;;(gts-google-engine)
         (gts-google-engine :parser (gts-google-summary-parser))
         (gts-google-rpc-engine)
         ;;(gts-deepl-engine :auth-key "2e20bade-88e9-02f3-169f-ab3c445d7984:fx" :pro nil)

         ;;(gts-google-engine :parser (gts-google-parser))
         ;;(gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
         )

        :render
        (gts-buffer-render)

        ;;(gts-posframe-pop-render)
        ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")

        ;;(gts-posframe-pin-render)
        ;;(gts-posframe-pin-render :position (cons 1200 20) :width 50 :height 18)
        ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")

        ;;(gts-kill-ring-render)
        ))

 (define-key gts-prompt-for-translate-keymap [f5]
   (lambda () (interactive) (exit-minibuffer))))


(with-eval-after-load 'eglot
  ;;  (aset eglot--uri-path-allowed-chars ?: t)
  )

(with-eval-after-load 'eglot-cls
  ;;(add-to-list 'eglot-server-programs '(csharp-mode . ("Omnisharp.exe" "-lsp")))
  )

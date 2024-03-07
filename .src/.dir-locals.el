((nil
  (user-full-name . "ai.net")
  (org-html-head-include-default-style . nil)
  (org-html-htmlize-output-type . inline-css)
  (org-publish-sitemap-custom-function . org-publish-sitemap-2)
  (org-html-head . "<link rel='stylesheet' href='/asset/common.css?33442' />
<script src='https://cdn.bootcss.com/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script src='/asset/common.js'></script>\n")
  (eval . (setq-local org-publish-project-alist
                      `(("freelazy_org"
                         :base-directory "."
                         :base-extension "org"
                         :exclude "^\\(\\.\\|x\\.\\|0\\).*"
                         :publishing-directory "../"
                         :publishing-function org-html-publish-to-html
                         :recursive t
                         :headline-levels 5
                         :with-toc 5
                         :author "zombiiiie"
                         :html-metadata-timestamp-format "%Y-%m-%d"
                         :html-preamble t
                         :auto-sitemap t
                         :sitemap-filename ".sitemap.org")
                        ("freelazy_assets"
                         :base-directory "."
                         :base-extension "css\\|js\\|png\\|jpe?g\\|gif\\|svg\\|pdf\\|zip\\|html\\|txt\\|jar\\|mp4\\|rar\\|doc\\|pptx"
                         :exclude "^\\(\\.\\|x\\.\\).*"
                         :publishing-directory "../"
                         :publishing-function org-publish-attachment
                         :recursive t)
                        ("nnn" :components
                         ("freelazy_assets" "freelazy_org")))))
  (eval . (ignore-errors (load-file "./.local.el")))))

(prelude-require-packages '(org-bullets
                            org-preview-html
                            yasnippet
                            yasnippet-snippets
                            org-drill
                            ;; Syntax highlight for HTML export.
                            htmlize
                            ;; Support to mermaid diagrams.
                            ob-mermaid))

(defun personal-org-mode-defaults ()
  ;; (setq truncate-lines nil)
  (visual-line-mode +1)

  (require 'yasnippet)
  (yas-reload-all)
  (yas-minor-mode +1)

  (require 'org-bullets)
  (org-bullets-mode +1)

  (smartparens-mode +1)

  ;; Always set the path to the binary "mmdc".
  (setq ob-mermaid-cli-path "")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((mermaid . t)))

  (require 'evil)
  (evil-define-key 'normal org-mode-map
    "zk" 'org-previous-visible-heading
    "zj" 'org-next-visible-heading))

(add-hook 'whitespace-mode-hook
          (lambda ()
            (setq whitespace-style '(face tabs empty trailing))))
(add-hook 'org-mode-hook #'personal-org-mode-defaults)

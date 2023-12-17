(prelude-require-packages '(org-bullets
                            org-preview-html
                            yasnippet
                            yasnippet-snippets
                            org-drill
                            ;; Syntax highlight for HTML export.
                            htmlize
                            ;; Support to mermaid diagrams.
                            ob-mermaid
                            ;; Additional evil keybindings for org mode.
                            evil-org))

(defun personal-org-mode-defaults ()
  ;; The following function can be used in table formula to convert values to
  ;; different units.
  ;; Reference:
  ;; https://emacs.stackexchange.com/a/46228/31688
  (defmath uconvert (v u)
    "Convert value V to compatible unit U."
    (math-convert-units v u))

  (evil-org-mode +1)
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

  ;; These settings are useful to produce Latex previews inside orgmode
  ;; documents. The first is a requirement; the second is optional.
  ;; Required apt packages: dvipng texlive-latex-extra
  (setq org-latex-create-formula-image-program 'dvipng)
  (setq org-format-latex-options
        ;; Increases the size of the previews.
        (plist-put org-format-latex-options :scale 1.75))

  (require 'evil)
  (evil-define-key 'normal org-mode-map
    "zk" 'org-previous-visible-heading
    "zj" 'org-next-visible-heading)

  (require 'whitespace)
  ;; We disable the highlight of long text lines, but only for Org files.
  (make-local-variable 'whitespace-line-column)
  (setq whitespace-line-column -1))

(add-hook 'org-mode-hook 'personal-org-mode-defaults)

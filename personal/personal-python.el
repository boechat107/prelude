;;;;;;;;;;;;;;;;
;; How to use ;;
;;;;;;;;;;;;;;;;
;;
;; Assuming the Python project already has a virtual env folder:
;; 1. Open a project file.
;; 2. Call "pyvenv-activate" and choose the project's venv folder.
;; 3. If a Python file is already open, reload it with "revert-buffer".
;; 4. Check if you can see the file path at the top of the folder (an
;; indication that the LSP is running).
;;
;; "lsp-workspace-restart" is handy after installing libraries in the venv.

(require 'prelude-python)

;; Stop asking about risky local variable settings.
;; https://emacs.stackexchange.com/a/10989/31688
; (add-to-list 'safe-local-variable-values
;              '(flycheck-python-flake8-executable . "./venv/bin/flake8"))
; (add-to-list 'safe-local-variable-values
;              '(flycheck-python-mypy-executable . "./venv/bin/mypy"))

(use-package python-black
  :ensure t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(use-package python-isort
  :ensure t
  :after python
  :hook (python-mode . python-isort-on-save-mode))

(use-package mise
  :ensure t
  :after python
  :hook (python-mode . mise-mode))

(defun personal-python-mode-defaults ()
  (pyvenv-mode +1)
  (hs-minor-mode +1)
  (anaconda-mode -1)
  (setq python-shell-interpreter "ipython"
        ;; https://emacs.stackexchange.com/a/37876/31688
        python-shell-interpreter-args "--simple-prompt --pprint")
  (evil-define-key 'normal python-mode-map "K" 'lsp-ui-doc-show)
  (evil-define-key 'normal python-mode-map "gd" 'lsp-find-definition)
  ;; We can jump back to the code using the definition.
  ;; Ref.: https://github.com/emacs-evil/evil/issues/1354
  ;(evil-set-command-property 'anaconda-mode-find-definitions :jump t)
  ;(evil-set-command-property 'anaconda-mode-find-assignments :jump t)
  (message "Personal Python default fn executed"))

(add-hook 'python-mode-hook 'personal-python-mode-defaults 91)
;; Enables function signature in the echo area.
;; https://github.com/pythonic-emacs/anaconda-mode#eldoc
;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(add-hook 'python-mode-hook #'lsp-deferred)

;;;;;;;;;;;;;;;;
;; How to use ;;
;;;;;;;;;;;;;;;;
;;
;; Assuming the Python project already has a virtual env folder:
;; 1. Open a project file.
;; 2. Call "pyvenv-activate" and choose the project's venv folder.
;; 3. If a Python file is already open, reload it with "revert-buffer".
;; 4. Check if you can see the file path at the top of the folder (an
;;    indication that the LSP is running).
;;
;; "lsp-workspace-restart" is handy after installing libraries in the venv.
;;
;; Pyright must be available on PATH: pip install pyright (per-venv) or
;; npm install -g pyright (global). With mise, activate the venv first so
;; lsp-pyright picks the correct interpreter automatically.

(require 'prelude-python)

;; Stop asking about risky local variable settings.
;; https://emacs.stackexchange.com/a/10989/31688
; (add-to-list 'safe-local-variable-values
;              '(flycheck-python-flake8-executable . "./venv/bin/flake8"))

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

(use-package lsp-pyright
  :ensure t
  :after python
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))
  :custom
  ;; "basic" catches common type errors without strict mode noise.
  ;; Switch to "strict" for fully annotated codebases.
  (lsp-pyright-typechecking-mode "basic")
  ;; Flymake and flycheck are independent systems — using flymake for pyright
  ;; prevents lsp-ui from restarting flycheck when diagnostics arrive.
  (lsp-diagnostics-provider :flymake))

(defun personal-python-mode-defaults ()
  (hs-minor-mode +1)
  (anaconda-mode -1)
  (flycheck-select-checker 'python-flake8)
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt --pprint")
  (evil-define-key 'normal python-mode-map "K" 'lsp-ui-doc-show)
  (evil-define-key 'normal python-mode-map "gd" 'lsp-find-definition)
  (message "Personal Python default fn executed"))

(add-hook 'python-mode-hook 'personal-python-mode-defaults 91)

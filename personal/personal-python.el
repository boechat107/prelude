(prelude-require-packages '(poetry python-black))

;; Stop asking about risky local variable settings.
;; https://emacs.stackexchange.com/a/10989/31688
(add-to-list 'safe-local-variable-values
             '(flycheck-python-flake8-executable . "./venv/bin/python"))

(defun personal-python-mode-defaults ()
  (pyvenv-mode +1)
  (hs-minor-mode +1))

(add-hook 'python-mode-hook 'personal-python-mode-defaults)
;; Enables function signature in the echo area.
;; https://github.com/pythonic-emacs/anaconda-mode#eldoc
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

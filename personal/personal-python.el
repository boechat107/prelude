(prelude-require-package 'poetry)

(defun personal-python-mode-defaults ()
  (hs-minor-mode +1))

(add-hook 'python-mode-hook 'personal-python-mode-defaults)

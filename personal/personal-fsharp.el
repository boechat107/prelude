(require 'prelude-programming)

(prelude-require-packages '(fsharp-mode eglot-fsharp))
(require 'fsharp-mode)
;; WARNING: I couldn't make "eglot-fsharp" work out-of-box. I had to
;; manually download "FsAutoComplete" and move to a directory
;; structure similar to the one automatically created by "eglot-fsharp".
(require 'eglot-fsharp)

(add-to-list 'auto-mode-alist '("\\.fs\\'" . fsharp-mode))

(provide 'personal-fsharp)

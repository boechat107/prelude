(require 'prelude-c)

;; Formatting code with "format-all"
;; https://github.com/lassik/emacs-format-all-the-code
;;
;; An example of a file ".clang-format"
;; ---
;; BasedOnStyle: LLVM
;; IndentWidth: 4
;; ---
(prelude-require-packages '(format-all))

(with-eval-after-load 'cc-mode
  (add-hook 'prelude-c-mode-common-hook
            (lambda ()
              (hs-minor-mode +1))))

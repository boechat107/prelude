;;;  personal-ledger.el --- Emacs configuration for ledger-mode
;;
;; Author: Andre Ambrosio Boechat

;;; Code:

(prelude-require-packages '(ledger-mode))
(require 'ledger-xact)

(with-eval-after-load 'ledger-mode

  (defun pledger--parse-date-from-xact-string (transaction)
    "Return the date of string."
    (if (string-match ledger-iso-date-regexp transaction)
        (match-string 1 transaction)))

  (defun pledger--parse-replication-number-from-xact (transaction)
    "Return the total number of replicas for the given transaction;
throw an error if the number is not found."
    (if (string-match "1/\\([0-9]+\\)$" transaction)
        (1-
         (string-to-number
          (match-string 1 transaction)))
      (error "Transaction doesn't contain the replication number: 1/N-MONTHS")))

  (defun pledger-replicate-transaction-at-point ()
    "Replicate the trancation for the next N-MONTHS.

The transaction title must end with the pattern \"1/N-MONTHS\",
where N-MONTHS must be a number. Useful to add monthly
installments."
    (interactive)
    (let* ((extents (ledger-navigate-find-xact-extents (point)))
           (transaction (buffer-substring-no-properties
                         (car extents)
                         (cadr extents)))
           (n-replicas (pledger--parse-replication-number-from-xact transaction))
           (date-parts (split-string
                        (pledger--parse-date-from-xact-string transaction)
                        "/"))
           (year (string-to-number (car date-parts)))
           (month (string-to-number (cadr date-parts))))
      (dotimes (i n-replicas)
        (setq month (1+ month))
        (when (> month 12)
          (setq month 1)
          (setq year (1+ year)))
        ;; Inserting the transaction on the buffer. It has the expected date.
        (ledger-copy-transaction-at-point
         (format "%d/%02d/%02d" year month (string-to-number (caddr date-parts))))
        ;; Updating the replication counter of the inserted transaction.
        (ledger-navigate-beginning-of-xact)
        (re-search-forward "[0-9]+/[0-9]+$")
        (replace-match (format "%d/%d" (+ 2 i) (1+ n-replicas))))))

  (defun personal-ledger-mode-defaults ()
    "Default configuration for ledger-mode."
    (setq ledger-copy-transaction-insert-blank-line-after t))

  (add-hook 'ledger-mode-hook 'personal-ledger-mode-defaults))

(provide 'personal-ledger)
;;; personal-ledger.el ends here

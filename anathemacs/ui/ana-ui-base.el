;;; ana-ui-base.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:
(use-package better-defaults)

(use-package mwim
  :init
  (general-define-key
   "C-a" 'mwim-beginning-of-code-or-line
   "C-e" 'mwim-end-of-code-or-line
   "<home>" 'mwim-beginning-of-line-or-code
   "<end>"  'mwim-end-of-line-or-code
   ))

(use-package format-all)

(use-package pretty-mode
  :config
  (progn
    (global-pretty-mode t)
    (global-prettify-symbols-mode 1)
     (pretty-deactivate-groups
      '(:equality :ordering :ordering-double :ordering-triple
                  :arrows :arrows-twoheaded :punctuation
                  :logic :sets))
     (pretty-activate-groups
      '(:greek :arithmetic-nary))
     ))

(add-hook 'text-mode-hook 'auto-fill-mode)
(diminish 'auto-fill-function)
(add-hook 'text-mode-hook 'visual-line-mode)
(diminish 'visual-line-mode)

(provide 'ana-ui-base)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-ui-base.el ends here

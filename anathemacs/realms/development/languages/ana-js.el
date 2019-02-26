;;; ana-bibtex.el ---

;; Author: e.g. pavelka <pav@egpavelka.com>
;; URL: https://github.com/egpavelka/anathemacs

;;; Commentary:
;;
;;

;;; Code:
(eval-when-compile
  (require 'ana-base))

;; javascript
(use-package js-doc
  :defer t)

(use-package js2-mode
  :defer t)

(use-package js2-refactor
  :defer t)

;; json
(use-package json-mode
  :defer t)

(use-package json-navigator
  :defer t)

(use-package json-snatcher
  :defer t)

(provide 'ana-bibtex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ana-bibtex.el ends here
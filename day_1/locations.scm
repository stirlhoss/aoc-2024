(define-module (locations))
(use-modules (ice-9 rdelim))

(with-input-from-file "day_1/input.txt"
  (lambda ()
    (let loop ((line (read-line)))
      (if (not (eof-object? line))
          (begin
            (display line)
            (newline)
            (loop (read-line)))))))

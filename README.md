# Database with questions for BSI

## How to add or edit questions:

1. Add/edit in 00-bsi-full
2. If adding new question copy it to suitable split database
2. Run:

``` bash
make sync
```

3. If image is necessary add to img in 00-bsi-full
4. Run:

``` bash
make images
```

5. Test with testing directory 
6. Commit and push

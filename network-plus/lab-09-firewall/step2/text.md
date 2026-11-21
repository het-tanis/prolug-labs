
The rule is already in place, so now the connection should fail or time out:

```plain
curl -s --max-time 2 http://127.0.0.1:8080 >/dev/null || echo "blocked as intended"
```{{exec}}

If it still answers, check the chain order and the hook.

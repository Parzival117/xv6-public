
_foo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 19                	mov    (%ecx),%ebx
  16:	8b 71 04             	mov    0x4(%ecx),%esi
	int k, n, id;
	double x=0, z, d;

	if(argc < 2)
  19:	83 fb 01             	cmp    $0x1,%ebx
  1c:	7f 6f                	jg     8d <main+0x8d>

	if(n< 0 || n> 20)
		n = 2;

	if(argc < 3)
		d=1.0;
  1e:	d9 e8                	fld1   
		n = 1;		//default value for number of process to create
  20:	bf 01 00 00 00       	mov    $0x1,%edi
		d=1.0;
  25:	dd 5d e0             	fstpl  -0x20(%ebp)
		n = 1;		//default value for number of process to create
  28:	31 db                	xor    %ebx,%ebx
  2a:	eb 2c                	jmp    58 <main+0x58>
  2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	id = 0;
	for( k =0; k< n;k++){
		id = fork();
		if(id < 0){
			printf(1, "%d failed in fork!\n", getpid() );
		}else if (id > 0){
  30:	0f 84 97 00 00 00    	je     cd <main+0xcd>
			printf(1, "Parent %d creating child %d\n", getpid(), id);
  36:	e8 b7 03 00 00       	call   3f2 <getpid>
  3b:	56                   	push   %esi
  3c:	50                   	push   %eax
	for( k =0; k< n;k++){
  3d:	83 c3 01             	add    $0x1,%ebx
			printf(1, "Parent %d creating child %d\n", getpid(), id);
  40:	68 4c 08 00 00       	push   $0x84c
  45:	6a 01                	push   $0x1
  47:	e8 94 04 00 00       	call   4e0 <printf>
			wait();
  4c:	e8 29 03 00 00       	call   37a <wait>
  51:	83 c4 10             	add    $0x10,%esp
	for( k =0; k< n;k++){
  54:	39 fb                	cmp    %edi,%ebx
  56:	7d 30                	jge    88 <main+0x88>
		id = fork();
  58:	e8 0d 03 00 00       	call   36a <fork>
		if(id < 0){
  5d:	85 c0                	test   %eax,%eax
		id = fork();
  5f:	89 c6                	mov    %eax,%esi
		if(id < 0){
  61:	79 cd                	jns    30 <main+0x30>
			printf(1, "%d failed in fork!\n", getpid() );
  63:	e8 8a 03 00 00       	call   3f2 <getpid>
  68:	83 ec 04             	sub    $0x4,%esp
	for( k =0; k< n;k++){
  6b:	83 c3 01             	add    $0x1,%ebx
			printf(1, "%d failed in fork!\n", getpid() );
  6e:	50                   	push   %eax
  6f:	68 38 08 00 00       	push   $0x838
  74:	6a 01                	push   $0x1
  76:	e8 65 04 00 00       	call   4e0 <printf>
  7b:	83 c4 10             	add    $0x10,%esp
	for( k =0; k< n;k++){
  7e:	39 fb                	cmp    %edi,%ebx
  80:	7c d6                	jl     58 <main+0x58>
  82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
				x = x + 3.14 * 89.64;	//computation to take CPU time
			}
			break;
		}
	}
	exit();
  88:	e8 e5 02 00 00       	call   372 <exit>
		n = atoi(argv[1]);
  8d:	83 ec 0c             	sub    $0xc,%esp
  90:	ff 76 04             	pushl  0x4(%esi)
  93:	e8 68 02 00 00       	call   300 <atoi>
	if(n< 0 || n> 20)
  98:	83 c4 10             	add    $0x10,%esp
  9b:	83 f8 14             	cmp    $0x14,%eax
		n = atoi(argv[1]);
  9e:	89 c7                	mov    %eax,%edi
	if(n< 0 || n> 20)
  a0:	76 66                	jbe    108 <main+0x108>
	if(argc < 3)
  a2:	83 fb 02             	cmp    $0x2,%ebx
  a5:	7e 52                	jle    f9 <main+0xf9>
		n = 2;
  a7:	bf 02 00 00 00       	mov    $0x2,%edi
		d = atoi(argv[2]);
  ac:	83 ec 0c             	sub    $0xc,%esp
  af:	ff 76 08             	pushl  0x8(%esi)
  b2:	e8 49 02 00 00       	call   300 <atoi>
  b7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	db 45 e0             	fildl  -0x20(%ebp)
  c0:	dd 5d e0             	fstpl  -0x20(%ebp)
	for( k =0; k< n;k++){
  c3:	85 ff                	test   %edi,%edi
  c5:	0f 85 5d ff ff ff    	jne    28 <main+0x28>
  cb:	eb bb                	jmp    88 <main+0x88>
			printf(1, "Child %d created\n",getpid() );
  cd:	e8 20 03 00 00       	call   3f2 <getpid>
  d2:	52                   	push   %edx
  d3:	50                   	push   %eax
  d4:	68 69 08 00 00       	push   $0x869
  d9:	6a 01                	push   $0x1
  db:	e8 00 04 00 00       	call   4e0 <printf>
			for(z = 0; z < 8000000.0; z +=d){
  e0:	d9 ee                	fldz   
			printf(1, "Child %d created\n",getpid() );
  e2:	83 c4 10             	add    $0x10,%esp
  e5:	8d 76 00             	lea    0x0(%esi),%esi
			for(z = 0; z < 8000000.0; z +=d){
  e8:	dc 45 e0             	faddl  -0x20(%ebp)
  eb:	d9 05 7c 08 00 00    	flds   0x87c
  f1:	df e9                	fucomip %st(1),%st
  f3:	77 f3                	ja     e8 <main+0xe8>
  f5:	dd d8                	fstp   %st(0)
  f7:	eb 8f                	jmp    88 <main+0x88>
		d=1.0;
  f9:	d9 e8                	fld1   
		n = 2;
  fb:	bf 02 00 00 00       	mov    $0x2,%edi
		d=1.0;
 100:	dd 5d e0             	fstpl  -0x20(%ebp)
 103:	e9 20 ff ff ff       	jmp    28 <main+0x28>
	if(argc < 3)
 108:	83 fb 02             	cmp    $0x2,%ebx
 10b:	75 9f                	jne    ac <main+0xac>
		d=1.0;
 10d:	d9 e8                	fld1   
 10f:	dd 5d e0             	fstpl  -0x20(%ebp)
 112:	eb af                	jmp    c3 <main+0xc3>
 114:	66 90                	xchg   %ax,%ax
 116:	66 90                	xchg   %ax,%ax
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12a:	89 c2                	mov    %eax,%edx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c1 01             	add    $0x1,%ecx
 133:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 db                	test   %bl,%bl
 13c:	88 5a ff             	mov    %bl,-0x1(%edx)
 13f:	75 ef                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 141:	5b                   	pop    %ebx
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	84 c0                	test   %al,%al
 162:	75 1c                	jne    180 <strcmp+0x30>
 164:	eb 2a                	jmp    190 <strcmp+0x40>
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 170:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 173:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 176:	83 c1 01             	add    $0x1,%ecx
 179:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 17c:	84 c0                	test   %al,%al
 17e:	74 10                	je     190 <strcmp+0x40>
 180:	38 d8                	cmp    %bl,%al
 182:	74 ec                	je     170 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 184:	29 d8                	sub    %ebx,%eax
}
 186:	5b                   	pop    %ebx
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 192:	29 d8                	sub    %ebx,%eax
}
 194:	5b                   	pop    %ebx
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a6:	80 39 00             	cmpb   $0x0,(%ecx)
 1a9:	74 15                	je     1c0 <strlen+0x20>
 1ab:	31 d2                	xor    %edx,%edx
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 1c0:	31 c0                	xor    %eax,%eax
}
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	74 1d                	je     21e <strchr+0x2e>
    if(*s == c)
 201:	38 d3                	cmp    %dl,%bl
 203:	89 d9                	mov    %ebx,%ecx
 205:	75 0d                	jne    214 <strchr+0x24>
 207:	eb 17                	jmp    220 <strchr+0x30>
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 210:	38 ca                	cmp    %cl,%dl
 212:	74 0c                	je     220 <strchr+0x30>
  for(; *s; s++)
 214:	83 c0 01             	add    $0x1,%eax
 217:	0f b6 10             	movzbl (%eax),%edx
 21a:	84 d2                	test   %dl,%dl
 21c:	75 f2                	jne    210 <strchr+0x20>
      return (char*)s;
  return 0;
 21e:	31 c0                	xor    %eax,%eax
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 236:	31 f6                	xor    %esi,%esi
 238:	89 f3                	mov    %esi,%ebx
{
 23a:	83 ec 1c             	sub    $0x1c,%esp
 23d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 240:	eb 2f                	jmp    271 <gets+0x41>
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 248:	8d 45 e7             	lea    -0x19(%ebp),%eax
 24b:	83 ec 04             	sub    $0x4,%esp
 24e:	6a 01                	push   $0x1
 250:	50                   	push   %eax
 251:	6a 00                	push   $0x0
 253:	e8 32 01 00 00       	call   38a <read>
    if(cc < 1)
 258:	83 c4 10             	add    $0x10,%esp
 25b:	85 c0                	test   %eax,%eax
 25d:	7e 1c                	jle    27b <gets+0x4b>
      break;
    buf[i++] = c;
 25f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 263:	83 c7 01             	add    $0x1,%edi
 266:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 269:	3c 0a                	cmp    $0xa,%al
 26b:	74 23                	je     290 <gets+0x60>
 26d:	3c 0d                	cmp    $0xd,%al
 26f:	74 1f                	je     290 <gets+0x60>
  for(i=0; i+1 < max; ){
 271:	83 c3 01             	add    $0x1,%ebx
 274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 277:	89 fe                	mov    %edi,%esi
 279:	7c cd                	jl     248 <gets+0x18>
 27b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 280:	c6 03 00             	movb   $0x0,(%ebx)
}
 283:	8d 65 f4             	lea    -0xc(%ebp),%esp
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
 28b:	90                   	nop
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 290:	8b 75 08             	mov    0x8(%ebp),%esi
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	01 de                	add    %ebx,%esi
 298:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 29a:	c6 03 00             	movb   $0x0,(%ebx)
}
 29d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2a0:	5b                   	pop    %ebx
 2a1:	5e                   	pop    %esi
 2a2:	5f                   	pop    %edi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	pushl  0x8(%ebp)
 2bd:	e8 f0 00 00 00       	call   3b2 <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	pushl  0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 f3 00 00 00       	call   3ca <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 b9 00 00 00       	call   39a <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 11             	movsbl (%ecx),%edx
 30a:	8d 42 d0             	lea    -0x30(%edx),%eax
 30d:	3c 09                	cmp    $0x9,%al
  n = 0;
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 314:	77 1f                	ja     335 <atoi+0x35>
 316:	8d 76 00             	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 320:	8d 04 80             	lea    (%eax,%eax,4),%eax
 323:	83 c1 01             	add    $0x1,%ecx
 326:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 32a:	0f be 11             	movsbl (%ecx),%edx
 32d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	5b                   	pop    %ebx
 336:	5d                   	pop    %ebp
 337:	c3                   	ret    
 338:	90                   	nop
 339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
 345:	8b 5d 10             	mov    0x10(%ebp),%ebx
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 db                	test   %ebx,%ebx
 350:	7e 14                	jle    366 <memmove+0x26>
 352:	31 d2                	xor    %edx,%edx
 354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 358:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 35c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 35f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 362:	39 d3                	cmp    %edx,%ebx
 364:	75 f2                	jne    358 <memmove+0x18>
  return vdst;
}
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret    

0000036a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36a:	b8 01 00 00 00       	mov    $0x1,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <exit>:
SYSCALL(exit)
 372:	b8 02 00 00 00       	mov    $0x2,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <wait>:
SYSCALL(wait)
 37a:	b8 03 00 00 00       	mov    $0x3,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <pipe>:
SYSCALL(pipe)
 382:	b8 04 00 00 00       	mov    $0x4,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <read>:
SYSCALL(read)
 38a:	b8 05 00 00 00       	mov    $0x5,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <write>:
SYSCALL(write)
 392:	b8 10 00 00 00       	mov    $0x10,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <close>:
SYSCALL(close)
 39a:	b8 15 00 00 00       	mov    $0x15,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <kill>:
SYSCALL(kill)
 3a2:	b8 06 00 00 00       	mov    $0x6,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <exec>:
SYSCALL(exec)
 3aa:	b8 07 00 00 00       	mov    $0x7,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <open>:
SYSCALL(open)
 3b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mknod>:
SYSCALL(mknod)
 3ba:	b8 11 00 00 00       	mov    $0x11,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <unlink>:
SYSCALL(unlink)
 3c2:	b8 12 00 00 00       	mov    $0x12,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <fstat>:
SYSCALL(fstat)
 3ca:	b8 08 00 00 00       	mov    $0x8,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <link>:
SYSCALL(link)
 3d2:	b8 13 00 00 00       	mov    $0x13,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <mkdir>:
SYSCALL(mkdir)
 3da:	b8 14 00 00 00       	mov    $0x14,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <chdir>:
SYSCALL(chdir)
 3e2:	b8 09 00 00 00       	mov    $0x9,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <dup>:
SYSCALL(dup)
 3ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <getpid>:
SYSCALL(getpid)
 3f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <sbrk>:
SYSCALL(sbrk)
 3fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <sleep>:
SYSCALL(sleep)
 402:	b8 0d 00 00 00       	mov    $0xd,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <uptime>:
SYSCALL(uptime)
 40a:	b8 0e 00 00 00       	mov    $0xe,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <cps>:
SYSCALL(cps)
 412:	b8 16 00 00 00       	mov    $0x16,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <chpr>:
SYSCALL(chpr)
 41a:	b8 17 00 00 00       	mov    $0x17,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <setprio>:
SYSCALL(setprio)
 422:	b8 19 00 00 00       	mov    $0x19,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <getprio>:
SYSCALL(getprio)
 42a:	b8 18 00 00 00       	mov    $0x18,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    
 432:	66 90                	xchg   %ax,%ax
 434:	66 90                	xchg   %ax,%ax
 436:	66 90                	xchg   %ax,%ax
 438:	66 90                	xchg   %ax,%ax
 43a:	66 90                	xchg   %ax,%ax
 43c:	66 90                	xchg   %ax,%ax
 43e:	66 90                	xchg   %ax,%ax

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 449:	85 d2                	test   %edx,%edx
{
 44b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 44e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 450:	79 76                	jns    4c8 <printint+0x88>
 452:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 456:	74 70                	je     4c8 <printint+0x88>
    x = -xx;
 458:	f7 d8                	neg    %eax
    neg = 1;
 45a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 461:	31 f6                	xor    %esi,%esi
 463:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 466:	eb 0a                	jmp    472 <printint+0x32>
 468:	90                   	nop
 469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 fe                	mov    %edi,%esi
 472:	31 d2                	xor    %edx,%edx
 474:	8d 7e 01             	lea    0x1(%esi),%edi
 477:	f7 f1                	div    %ecx
 479:	0f b6 92 88 08 00 00 	movzbl 0x888(%edx),%edx
  }while((x /= base) != 0);
 480:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 482:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 485:	75 e9                	jne    470 <printint+0x30>
  if(neg)
 487:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 48a:	85 c0                	test   %eax,%eax
 48c:	74 08                	je     496 <printint+0x56>
    buf[i++] = '-';
 48e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 493:	8d 7e 02             	lea    0x2(%esi),%edi
 496:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 49a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4a3:	83 ec 04             	sub    $0x4,%esp
 4a6:	83 ee 01             	sub    $0x1,%esi
 4a9:	6a 01                	push   $0x1
 4ab:	53                   	push   %ebx
 4ac:	57                   	push   %edi
 4ad:	88 45 d7             	mov    %al,-0x29(%ebp)
 4b0:	e8 dd fe ff ff       	call   392 <write>

  while(--i >= 0)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	39 de                	cmp    %ebx,%esi
 4ba:	75 e4                	jne    4a0 <printint+0x60>
    putc(fd, buf[i]);
}
 4bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4bf:	5b                   	pop    %ebx
 4c0:	5e                   	pop    %esi
 4c1:	5f                   	pop    %edi
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4c8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4cf:	eb 90                	jmp    461 <printint+0x21>
 4d1:	eb 0d                	jmp    4e0 <printf>
 4d3:	90                   	nop
 4d4:	90                   	nop
 4d5:	90                   	nop
 4d6:	90                   	nop
 4d7:	90                   	nop
 4d8:	90                   	nop
 4d9:	90                   	nop
 4da:	90                   	nop
 4db:	90                   	nop
 4dc:	90                   	nop
 4dd:	90                   	nop
 4de:	90                   	nop
 4df:	90                   	nop

000004e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ec:	0f b6 1e             	movzbl (%esi),%ebx
 4ef:	84 db                	test   %bl,%bl
 4f1:	0f 84 b3 00 00 00    	je     5aa <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 45 10             	lea    0x10(%ebp),%eax
 4fa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 4fd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 4ff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 502:	eb 2f                	jmp    533 <printf+0x53>
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 508:	83 f8 25             	cmp    $0x25,%eax
 50b:	0f 84 a7 00 00 00    	je     5b8 <printf+0xd8>
  write(fd, &c, 1);
 511:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 514:	83 ec 04             	sub    $0x4,%esp
 517:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 51a:	6a 01                	push   $0x1
 51c:	50                   	push   %eax
 51d:	ff 75 08             	pushl  0x8(%ebp)
 520:	e8 6d fe ff ff       	call   392 <write>
 525:	83 c4 10             	add    $0x10,%esp
 528:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 52b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 52f:	84 db                	test   %bl,%bl
 531:	74 77                	je     5aa <printf+0xca>
    if(state == 0){
 533:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 535:	0f be cb             	movsbl %bl,%ecx
 538:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 53b:	74 cb                	je     508 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 53d:	83 ff 25             	cmp    $0x25,%edi
 540:	75 e6                	jne    528 <printf+0x48>
      if(c == 'd'){
 542:	83 f8 64             	cmp    $0x64,%eax
 545:	0f 84 05 01 00 00    	je     650 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 54b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 551:	83 f9 70             	cmp    $0x70,%ecx
 554:	74 72                	je     5c8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 556:	83 f8 73             	cmp    $0x73,%eax
 559:	0f 84 99 00 00 00    	je     5f8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55f:	83 f8 63             	cmp    $0x63,%eax
 562:	0f 84 08 01 00 00    	je     670 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	0f 84 ef 00 00 00    	je     660 <printf+0x180>
  write(fd, &c, 1);
 571:	8d 45 e7             	lea    -0x19(%ebp),%eax
 574:	83 ec 04             	sub    $0x4,%esp
 577:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57b:	6a 01                	push   $0x1
 57d:	50                   	push   %eax
 57e:	ff 75 08             	pushl  0x8(%ebp)
 581:	e8 0c fe ff ff       	call   392 <write>
 586:	83 c4 0c             	add    $0xc,%esp
 589:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 58c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 58f:	6a 01                	push   $0x1
 591:	50                   	push   %eax
 592:	ff 75 08             	pushl  0x8(%ebp)
 595:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 598:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 59a:	e8 f3 fd ff ff       	call   392 <write>
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5a3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5a6:	84 db                	test   %bl,%bl
 5a8:	75 89                	jne    533 <printf+0x53>
    }
  }
}
 5aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ad:	5b                   	pop    %ebx
 5ae:	5e                   	pop    %esi
 5af:	5f                   	pop    %edi
 5b0:	5d                   	pop    %ebp
 5b1:	c3                   	ret    
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5b8:	bf 25 00 00 00       	mov    $0x25,%edi
 5bd:	e9 66 ff ff ff       	jmp    528 <printf+0x48>
 5c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5c8:	83 ec 0c             	sub    $0xc,%esp
 5cb:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d0:	6a 00                	push   $0x0
 5d2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 5d5:	8b 45 08             	mov    0x8(%ebp),%eax
 5d8:	8b 17                	mov    (%edi),%edx
 5da:	e8 61 fe ff ff       	call   440 <printint>
        ap++;
 5df:	89 f8                	mov    %edi,%eax
 5e1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e4:	31 ff                	xor    %edi,%edi
        ap++;
 5e6:	83 c0 04             	add    $0x4,%eax
 5e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5ec:	e9 37 ff ff ff       	jmp    528 <printf+0x48>
 5f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5fb:	8b 08                	mov    (%eax),%ecx
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 603:	85 c9                	test   %ecx,%ecx
 605:	0f 84 8e 00 00 00    	je     699 <printf+0x1b9>
        while(*s != 0){
 60b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 60e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 610:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 612:	84 c0                	test   %al,%al
 614:	0f 84 0e ff ff ff    	je     528 <printf+0x48>
 61a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 61d:	89 de                	mov    %ebx,%esi
 61f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 622:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 625:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 628:	83 ec 04             	sub    $0x4,%esp
          s++;
 62b:	83 c6 01             	add    $0x1,%esi
 62e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 631:	6a 01                	push   $0x1
 633:	57                   	push   %edi
 634:	53                   	push   %ebx
 635:	e8 58 fd ff ff       	call   392 <write>
        while(*s != 0){
 63a:	0f b6 06             	movzbl (%esi),%eax
 63d:	83 c4 10             	add    $0x10,%esp
 640:	84 c0                	test   %al,%al
 642:	75 e4                	jne    628 <printf+0x148>
 644:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 647:	31 ff                	xor    %edi,%edi
 649:	e9 da fe ff ff       	jmp    528 <printf+0x48>
 64e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	e9 73 ff ff ff       	jmp    5d2 <printf+0xf2>
 65f:	90                   	nop
  write(fd, &c, 1);
 660:	83 ec 04             	sub    $0x4,%esp
 663:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 666:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 669:	6a 01                	push   $0x1
 66b:	e9 21 ff ff ff       	jmp    591 <printf+0xb1>
        putc(fd, *ap);
 670:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 673:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 676:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 678:	6a 01                	push   $0x1
        ap++;
 67a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 67d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 680:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 683:	50                   	push   %eax
 684:	ff 75 08             	pushl  0x8(%ebp)
 687:	e8 06 fd ff ff       	call   392 <write>
        ap++;
 68c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 68f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 692:	31 ff                	xor    %edi,%edi
 694:	e9 8f fe ff ff       	jmp    528 <printf+0x48>
          s = "(null)";
 699:	bb 80 08 00 00       	mov    $0x880,%ebx
        while(*s != 0){
 69e:	b8 28 00 00 00       	mov    $0x28,%eax
 6a3:	e9 72 ff ff ff       	jmp    61a <printf+0x13a>
 6a8:	66 90                	xchg   %ax,%ax
 6aa:	66 90                	xchg   %ax,%ax
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 38 0b 00 00       	mov    0xb38,%eax
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c8:	39 c8                	cmp    %ecx,%eax
 6ca:	8b 10                	mov    (%eax),%edx
 6cc:	73 32                	jae    700 <free+0x50>
 6ce:	39 d1                	cmp    %edx,%ecx
 6d0:	72 04                	jb     6d6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d2:	39 d0                	cmp    %edx,%eax
 6d4:	72 32                	jb     708 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6d9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6dc:	39 fa                	cmp    %edi,%edx
 6de:	74 30                	je     710 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e3:	8b 50 04             	mov    0x4(%eax),%edx
 6e6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e9:	39 f1                	cmp    %esi,%ecx
 6eb:	74 3a                	je     727 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ed:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6ef:	a3 38 0b 00 00       	mov    %eax,0xb38
}
 6f4:	5b                   	pop    %ebx
 6f5:	5e                   	pop    %esi
 6f6:	5f                   	pop    %edi
 6f7:	5d                   	pop    %ebp
 6f8:	c3                   	ret    
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 d0                	cmp    %edx,%eax
 702:	72 04                	jb     708 <free+0x58>
 704:	39 d1                	cmp    %edx,%ecx
 706:	72 ce                	jb     6d6 <free+0x26>
{
 708:	89 d0                	mov    %edx,%eax
 70a:	eb bc                	jmp    6c8 <free+0x18>
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 710:	03 72 04             	add    0x4(%edx),%esi
 713:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	8b 10                	mov    (%eax),%edx
 718:	8b 12                	mov    (%edx),%edx
 71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 723:	39 f1                	cmp    %esi,%ecx
 725:	75 c6                	jne    6ed <free+0x3d>
    p->s.size += bp->s.size;
 727:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 72a:	a3 38 0b 00 00       	mov    %eax,0xb38
    p->s.size += bp->s.size;
 72f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 732:	8b 53 f8             	mov    -0x8(%ebx),%edx
 735:	89 10                	mov    %edx,(%eax)
}
 737:	5b                   	pop    %ebx
 738:	5e                   	pop    %esi
 739:	5f                   	pop    %edi
 73a:	5d                   	pop    %ebp
 73b:	c3                   	ret    
 73c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 74c:	8b 15 38 0b 00 00    	mov    0xb38,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 752:	8d 78 07             	lea    0x7(%eax),%edi
 755:	c1 ef 03             	shr    $0x3,%edi
 758:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 75b:	85 d2                	test   %edx,%edx
 75d:	0f 84 9d 00 00 00    	je     800 <malloc+0xc0>
 763:	8b 02                	mov    (%edx),%eax
 765:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 768:	39 cf                	cmp    %ecx,%edi
 76a:	76 6c                	jbe    7d8 <malloc+0x98>
 76c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 772:	bb 00 10 00 00       	mov    $0x1000,%ebx
 777:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 77a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 781:	eb 0e                	jmp    791 <malloc+0x51>
 783:	90                   	nop
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 788:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 78a:	8b 48 04             	mov    0x4(%eax),%ecx
 78d:	39 f9                	cmp    %edi,%ecx
 78f:	73 47                	jae    7d8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 791:	39 05 38 0b 00 00    	cmp    %eax,0xb38
 797:	89 c2                	mov    %eax,%edx
 799:	75 ed                	jne    788 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 79b:	83 ec 0c             	sub    $0xc,%esp
 79e:	56                   	push   %esi
 79f:	e8 56 fc ff ff       	call   3fa <sbrk>
  if(p == (char*)-1)
 7a4:	83 c4 10             	add    $0x10,%esp
 7a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7aa:	74 1c                	je     7c8 <malloc+0x88>
  hp->s.size = nu;
 7ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7af:	83 ec 0c             	sub    $0xc,%esp
 7b2:	83 c0 08             	add    $0x8,%eax
 7b5:	50                   	push   %eax
 7b6:	e8 f5 fe ff ff       	call   6b0 <free>
  return freep;
 7bb:	8b 15 38 0b 00 00    	mov    0xb38,%edx
      if((p = morecore(nunits)) == 0)
 7c1:	83 c4 10             	add    $0x10,%esp
 7c4:	85 d2                	test   %edx,%edx
 7c6:	75 c0                	jne    788 <malloc+0x48>
        return 0;
  }
}
 7c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7cb:	31 c0                	xor    %eax,%eax
}
 7cd:	5b                   	pop    %ebx
 7ce:	5e                   	pop    %esi
 7cf:	5f                   	pop    %edi
 7d0:	5d                   	pop    %ebp
 7d1:	c3                   	ret    
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7d8:	39 cf                	cmp    %ecx,%edi
 7da:	74 54                	je     830 <malloc+0xf0>
        p->s.size -= nunits;
 7dc:	29 f9                	sub    %edi,%ecx
 7de:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7e1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7e4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7e7:	89 15 38 0b 00 00    	mov    %edx,0xb38
}
 7ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7f0:	83 c0 08             	add    $0x8,%eax
}
 7f3:	5b                   	pop    %ebx
 7f4:	5e                   	pop    %esi
 7f5:	5f                   	pop    %edi
 7f6:	5d                   	pop    %ebp
 7f7:	c3                   	ret    
 7f8:	90                   	nop
 7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 38 0b 00 00 3c 	movl   $0xb3c,0xb38
 807:	0b 00 00 
 80a:	c7 05 3c 0b 00 00 3c 	movl   $0xb3c,0xb3c
 811:	0b 00 00 
    base.s.size = 0;
 814:	b8 3c 0b 00 00       	mov    $0xb3c,%eax
 819:	c7 05 40 0b 00 00 00 	movl   $0x0,0xb40
 820:	00 00 00 
 823:	e9 44 ff ff ff       	jmp    76c <malloc+0x2c>
 828:	90                   	nop
 829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb b1                	jmp    7e7 <malloc+0xa7>

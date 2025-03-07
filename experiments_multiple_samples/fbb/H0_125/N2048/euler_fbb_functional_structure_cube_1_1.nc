CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T101848        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�����/?���1s@�5�xV@�W\@K@|̠C�3@�i�H��@#���*:@(�g[��@.7ŔK��@2w��Q@5N6�V�@8�1�z@<BG\A{�@?���3f5@A��8v'@C��bS]+@FQ�.@HH�H���@J��%�6@L���Ѓ@OD�Ƨ*@P��zk�@R!|�*@SmER�Le@T�����@VQ���@W4e�_�@X�d�j�@ZZ���y�@[��U/�@]Q֕��@^�fq��@`1���@`�����@a�6Yk@b��Hfn�@ch�h�Sk@d>�R�@e>�� �@e�0f��k@f��)U�@g�K��Ϳ@h�Z|N�]@ix���@j`0�a�@kJ�8�4@l7�"l�,@m'J�!�S@n����+@o�_��4@p�8��@p}�3Ŝ�@p����fn@qyQ=�1�@q��d���@ry��)@r����q#@s|�3�υ@t YM��@t��wLL�@u	��^�@u�0{v�|@vN� 6        ?�RL4rț?����l@	����Q�@����@ b�F2�@&�CW��Z@.[f�T�@3X�H��]@7��םs@<��z�3@A"�y�.�@C�~�/K�@Ge�e4@J8�����@M�h:�q�@P����r�@R^gs�-�@TDG��[@V;�|D@XC���^�@Z\ѯ��@\����*�@^��d���@`�1ߨ�@a�H�@b����y&@d#�,k:@eO��f�1@f�g�A�@g�5	�@i.$���@j���֟�@k�����@m?a�"�)@n���@p�"�|�@p�k��W@qyg7`h�@r5�� %@r�	�&4g@s����C@tw2�`�@u;��Q��@v��B�L@v�!���@w�����b@xbZ��{@y09�q#3@z !�}�@zѱ���@{��ɟ�s@|y�E���@}O��K�\@~'�E^� @ ����@�?=�n�@�[��|�@��E�\s�@�9�ھ�>@����`�@�/�|@�@��f����@��4���3        ?�B�}��E?������O@	�x��0@
`F���@ �8�g"�@'D��#@.׻hT�N@3��a,0@8O��"<@=^#�@Af½��Q@DL�^��@G_X��q@J�d3��@N^w��@P��H䠺@R����pf@T��Dl@V����k�@X�� !N�@Z�>M�[�@\���k��@_)�
n @`����;@a�>;l=�@c�
Y8�@d\II>��@e�c��@f��>���@h8ʟ���@i����50@j�!c{�@lL�"@m�@��a@o��4�@pH�2�d
@q9`1�y@q��{@r�d�s��@sD��_K5@t	��Z�@t��-�]�@u�ۛ��@vd�ֈW@w2HW�P@x"B���@x�4�#P@y�ͫ~v%@zyR���@{O�Vi*�@|'q'�s%@} ��Ҧ@}�����q@~��`��U@���?|�@�:�"�Y�@��`���@�lyQnB@���?k�@� f� X@�sL��ҩ@���;[�@�Z��%A        ?�Pz^@����@@��^�@%����RD@0bj_N�@6�+F��}@>D( ��@C@���/U@GŒZ5�L@L��x�S�@P�yд��@S���ή�@V�qPUT@Y� �NK@]���O�@`8j|�c�@a���E�@c�nS�@e�MV���@g��mbN@i�O��@k��wu�@m��}��u@p��{�~@q�'�L�@rB���k|@slO �l@t�Ґ��/@u�3���@wI���@xL��)�@y�ܲk@z�e���@|.���@}���B2p@~���\�@�,2��@��+�B%@��v�K�x@�< ��Oa@�������@���L�-@�l��9�?@�+��JQ@@��i�^"@����n@�t�Ak @�;U�C5@��-���@��h��
@���r�U@�h�S\TK@�8C/��v@�	�2sQ@�ܐ���@��!���@��B�U@�/u��t�@��
'���@�	Za�@�wa`��@��H�Rc@�U�D�x"        ?��=��Z�?�H�Ӫ_!@ ӻ��Nx@7�ec��@���J@��\�0@"�-)j�@'��r�@-2�ӏ�	@1t�P�}�@4;���!@7����p|@;�vi��@>�-A%�@A+�׳��@C�7�R@E����@G'L{�Y@IH��n��@K{+�4�@M�{K�#@P�.WB5@Q85�%Y@Rp���@S�{#d�@T��:*g@VAg�sN4@W�v]��c@X���ƫ@ZMjq�)�@[��\���@]a�d�W@^�wY��@`��~@`�=��$@a��QH�@bEξ7�@c
�L��@c�C;��@d��:��@ekrH���@f;=K
��@gyDЌ�@g�h�?P@h�$��@i���a@jn4`&��@kL)��%�@l,[&��@m��%@m�AJ�j�@n��I1@oH��9@pV�wݿP@p��w�N@qD1ui^,@q�q$�L@r5����@r���u��@s*�s%�@s����7�@t#��S�@t�HQJ�#        ?�׿�{/?�r��M�/@]�K���@�}�휋@ƹ�w=@%�Φ�7@,��QqL@2]�p9m@6�s�V
@;s�ۦW@@Eե�u1@B��iG�@E��a�>@H��%8��@L�����@Osj>�3y@Qwb��@SEt8JPH@U$_*R�@W��=@Y���ȼ@[r�W�Q@]7�n���@__��_@`�q��ˈ@a�:ܤ�@c��j�@d>���6@eq� �~@f����@g����=@i'ů�xO@jn��7@k�5��B�@m
Qӓ�@n^��l@@o���>_�@p�4�̒~@q:�@�$�@q����v�@r�.����@sW4�v�J@t�:B��@t�n�/�@u��}7�@v@'�z�@v�Rp  @w���v@x����@yAr����@z5-�w�@z�B��\@{��hm�@|X!�C}@} ���V�@}���y�'@~����k@�_��@�'�`aV�@��5UU�@���'@�_w���@��l
�]        ?��w�w�Y?�zW[���@���q@�EwU�@��H�R}@&�@�@-PB��	e@2�H���@7 R�l��@;�E�<@@�\���C@CXYM�y�@FI��(�@Id�8?�@L�tn=�#@P	Zy"B�@Q�1<���@S�[��@U�py�X�@W��?NzY@Y�#/�{p@[�k-�H@]����*a@`����h@a4����@b`B���@c�EK��@d�Κ�+�@f	��aM�@gN�	�	[@h��"�%�@i�8�ٷ4@k@q�D�<@l���+@m��qtj�@ob�n�~U@pf�����@qZ�z�s@q�]t�*�@r����'�@sS��v@t�����@t�
��V @u��(�<d@v`��ZL.@w)1��\~@w�?δѥ@x�	�2e,@y�}�8f�@z[�P�C�@{,w��A@{�)b��@|ћF$6�@}�du�@~|v�L�@S����|@��v�@����I�@��Mx�@�^2z�u@�̛���@�;�^�J�@���G��#        ?��R�g@2�I�F@%ZJFRA@#�F]{�@-�>٬6�@4� �Yh�@;4�"2��@AH߸�@EO�m�@I��\�\�@NQ��\�u@Q���N�@T>#�3�@V���I�P@Y�_d|45@\Ռ5c�@_��-C@a�=���@c:v>��\@d�=��S@f�WDc��@h�h|�@jX�&v�@l=bGP@n-3���@p��Q��@qQ���@r�l;�@s*C;��@t;~7Q��@uQeNzFp@vk�i7�@w��5�%@x��4��:@y�lْ�	@{g!?@|0�0��-@}dQ�}�r@~��yU%@�R�l��@��I!m�E@�,���1�@�����(@�u7�\t@���|@�Ĳ��A�@�o��<S@�����@�ȩ���@�w��ϾA@�(�TJ�$@��D��M@��@�F��@�D�N ̋@���jBǂ@��5�יL@�n 2��a@�)z��@��A�_]@��s�r�@�d�5�)@�%WG��@��d�b�        ?�D��;d?��GUXy@I�x\Z�@����@��z>��@��S��@#�B?2`@(�����@.��8-@1�D�-�@5��֘�@8k�y�P@;��_�|:@?�
 �/�@A��Hu#@C��#4�3@E�;A"@G�&!A�@I��`�@L*OV9X�@Nv~U@Pi܋�@Q�F�+�@Rڹ�w0@T[N%�@Uh;4�L)@V�ς5�k@X�!��@YlxC�
�@Z���E�@\7b*?,�@]���RQ@__^�X@`H�h�@a���z@a�����@b�f�;h�@cQ_e%@d�L��8@d�\�q{�@e�F��k$@f�e��g�@gQ�kW!�@h%+T?@h����#�@i�ǊO.@j���G�@k�Ei���@ld�/cu@mD-&�C@n%qt�*B@o�W�Ad@o�o��u@pj���K@p�B�Zh�@qST�ӈ
@q�D]t�@r@�"w@r��Z
+@s07N}�@s�R��Q@t#T�� @t�
�^        ?�F��G��?�ױe�=�@ɪFRT@V�e�@��ߏ�@&""߽2@-T�s��@2����@7%� @;�VX0�@@��p�Q�@CO�{P�@F<�wd��@IS0�b@L��wp�@O��L�K@Q�XWy��@S�<�h@Uw��8@Wmx�X�O@Yr��/�@[�v<�P�@]���?��@_ث/��@ag9�W@b0'(*�@c[�eM�s@d����@eĂ��m�@g�J��@hDW@�-{@i�bXw�@jٞ"u7�@l+�H�F�@m�Q�@n��I�k�@p��hأ@p� H��@q��qI	�@r=m^��;@r�&Xd�M@s��_�0@tmq�Y��@u+���@u�*�.�@v�0��;s@wq��/��@x7T�ڏ@x�X�V�2@y��V�*�@z��˙�Z@{\�R1��@|)o�W�E@|�����@}�L:h�X@~�"GǽP@j+�y�j@��7��@��՚���@��[��@�^�~.��@�ʆ�D=�@�6��A�        ?��"hf8?���T=@	4�RX�@mA,��@ ,���O@&� �4�b@-����>�@37/y�@7������@<�3���/@@��`&�@C�Mk��@F�ɣ�$�@I��ܰ|�@MJ^t#�'@Pc8���@R4B3�D�@T�\٨@V̀�v�@X5�@Z*ǗK@\P��l*�@^�A��U3@`fEd�do@a�hΆ'@b���#(@c�pǄ~�@e6y�U�Z@fz�u���@g�-@J�@ih8�`@jkH�[��@kơ�X�@m'H>�\@n�!��@o��I��@p��F�W�@qm�\��@r*b�>��@r���h�@s��g�1�@tl���@u1�!.@u��)��@v�і��@w��A݀Z@xY ��@y'c�c��@y�N@���@z���G @{��WA�@|p^��E@}FP=ׅ�@~�=/�	@~�H�|��@�8����@�U��6��@���O��@�2��=5H@���R"@�:�@����:�@������        ?�B��@hUw)�@j3��8@$����@/,Rg�p@5����!@<�� �@BE�S�U@F��m�@K$,�I_Q@P	jބ\�@R�i37Y@Ul�M��@XS�%�|@[]n��T@^��{�L@`�R���P@b������@d]mgk�@f,ϖ(  @h	]U�]@i����U@k�	$�@m�R<�6@o�
Y���@q�%�@r5���@s.�"���@tJQ[{^t@ujھ�^�@v�5�n#�@w�E�bBx@x��v�,@z�f�#@{S�U��r@|���k�@}ϐɟ,1@�u#�@�-�Җ9�@���D`~"@�{��3_@�%�p.��@��_��1C@�~ѿ�ۤ@�.� @@������@������@�E���@���_�R�@��>#�Ա@�lDkH@�&ӥ�4!@���`��4@����p#@�_�؏��@� +y�y@��6�'A@����x�/@�j�B�N�@�186��@���DL��@�a�DY�@��O���         ?�o�*J?���0x@ ��k@���DJ@���0 �@�їfWN@"�s=ؗJ@'�r=@-�QÌ�@1m��.@4�%���@7�M �H�@;.�t|@>��J��>@AC���@C7��<�@E>���@GW�G
E�@I�Ef|U�@K�� �:h@N	�ܽ�@P2���0@Qh;(�x�@R�Zk��@S���@U5J_,)A@V��`Թ$@W��q�Z@Y@:Q0?�@Z��s�#@\���@]�L� �@^��;dʁ@`;�=��@`��?L��@a�F1�#�@b�i:��@cO<�n@db@d�[��&�@e���1^@f��c��@g\�.�E�@h2�?"Ԇ@i
��ؤ�@i���yq@j�����@k��&o�V@l~���o�@m`	pԔ@nC)�K��@o'�}��@p4%��@p{;����@p���9�@qe���z�@q��7�@rS9��ҳ@r�&O?}�@sC�]^#@s�E���d@t7v�y�@t�f���Q        ?��=��?�<��&@	2*���@\��W�@ ���4�@&����@-��p��9@3���1@7���h@<��wT�@@�����@C��_G6m@F��ם}R@I���pӼ@MNN�M4�@PhQq:��@R="��Y�@T$���F�@V1[B
�@X+>���Z@ZH�Y��@\v��ԑ�@^��h(�]@`�}��A@a�$�\��@b�4�I��@d#x�v�Q@eg��h�G@f����Uh@hvJ���@i\�pO@j��/@l_O���@m������@n���/Ud@p7��g�|@p�,y�I@q�8_���@rw�����@s<�.��o@t���~�@t̓7��@u�6�h�+@vg�<�%@w6�[�@r@x�u��@@x�2��0@y��vHȷ@z���@{a�%)6�@|<��8B@}�|��@}���:�@~��W�@��,dY&@�L��!B@������@�1k�8�@��>�]��@�ߘ��@��zD�wL@�|R%#�@�w����        ?۩�.2�?�`�nH{@��[H˱@�x�43�@� x'@&	@,{
@-;	J@2�?x�o�@7| a7@;��3��@@�㯼�h@CP��Z<N@FA����@I\{�)@L�}���#@P���^�@Q���A"@S���qW`@U�mj���@W�L��@Y��Q8N@[����@]�1�X��@`
�n��@a..(tz�@bX%mn�@c��%�_@d�3Ǭ�v@e��G�Ù@g>9��3@h�3�Y��@iӌ�ʥ}@k&-�m@l}���;S@m�ې�F�@o:�yZ��@pP	x���@qݓW��@q��ˏ��@rt�i�@s/�����@s�wD�6@t�(U��@uk�[�-�@v-��i��@v�k�h�@w��cs�@x}��Ŀ@yF\Mڱ@z:����@z�x�oU�@{��~��@|uیէ�@}D����\@~�JN�@~�r�$j�@��?D1@�F"˯�@��U˜wB@���+�@��$��+@��ڀ�q@�]�l�        ?�4�C��@h�}��@\��a�@#�m7�y�@-˗o>�@4��j?(@;q�j��~@Ao���@E~S,.�@I���B@N�x�a��@Q�2���@Th���@W+�!q�$@Z>�SO@]�\�Ց@`����@a�l��D�@cc��.@eyť�@f�K��>I@h��[�*�@j�]}'�@l~`	6x@ns����@p9�t��~@q>�oa�.@rI!�0�@sXHjl�@tl3`��@u��Yű:@v���\��@w�\���@x��v��@z:H�@{?�V�T@|q0ܤ�@}�QD@~�Tе@��Mސ�@��z:8�@�N��&@���k?�@���ƞ�a@�=)�@���	��@��B��@�8����@��d��@��Ϝu@�@Ş���@�����1@����G�@�T��F��@�3��{@�����@�s�$�&@�*�d�@��Rq�y�@���BQ��@�V���@���?�@��#��qo        ?�鱮�%j?�\�W�}@ �
)p�1@z��iR�@B���@g�u�Y@#I,9�4!@(Vgb�~�@-�#8{B�@1�2�D�@5 )�4@�@8R�JK`�@;�i�bpW@?|���� @A��T�s@C�r��,@E���L5@G�CL���@JN4�M@LT�|��a@N��^#��@P����^@Qŕ��n1@S	�$X]@TS����@U�&:Ȃ@V�I'��4@X_1P��@Yũnױ�@[21���@\��z���@^���i@_�q��Q@@`�p(f@aVPN}�@b��j�@b�LJ;��@c�Gt��z@d��]6�7@eV�E��@f*�@�ɦ@g�W�$k@g�l �l�@h�sQ�.@i���@jq�iS�@kS2��ׄ@l6�o'�^@m�^<Fg@nE!�?y@n�nV�@o���9��@pb��N�@p�1�S%@qR���@q�/�%r@rF�֖ @r���[P@s=�7G�@s��F*�b@t8��'�;@t�N�Zr�@u6�0�c        ?ߠƥ�G?��E���@
���k��@�9�K@ �
�!�@'�Hg� @/qRPf@4�K�i@8���K@=�m��14@A�����@D��*�@GׇX�@K(�Cͩ�@N��N���@Q%:V��w@S��@U���@W��i�@Y1b�
�@[aij���@]�MY04�@_�}
@a*^��Ɩ@bb��w�v@c��@�8 @d餇\�@f7��X��@g�Ԫz��@h�y�o�@jJ�o/�_@k��ő�@m!�)�2@n�%
��@pdb]"@p��(�>�@q�����@rM��5k@s���9@sޏU_ki@t�t���@ux����@vH�m�@wcM��@w��[j;�@xƋqG�'@y�%!8YQ@zy�pr��@{V$6Ӥ7@|4qc���@}�b��@}�lX`57@~�����@�A���@�SƓb�@��I�rr@�<H����@���Tׇ@�(~d��@���t̜X@�|J}��@���39ݍ@�	�K�&        ?����$�?���Bl�@���9�@�yQ�/�@�C%�'e@&���Z?@-H0�W@2�y�p�P@7֕UK�@;�#Pc<$@@��DU�@CJ���n@F8����@IP*���@L���m�	@O�����@Q�p���@S��h�@U���2q@Wz�;��s@Y���9��@[�~�D�@]Ǖ�$
@_��r,k�@a"�ӵj�@bM$M�F%@c~��6�@d�����@e�ܠ@g7��u�@h��R��@iт�9��@k'yxV@l�B 5@m�|���g@oH��U.@pYM��@q�Y.I@q����<@r�Vb�&�@sE�z�?�@t�5.��@t�>�Z��@u��[E�U@vT���r@w;@�̈́@w瞴ƞ�@x�Ƈ�+�@y��:��P@zQ.b��@{"U���P@{���4@|�N�e�@}�8o��@~v?�o@N���@�r�$��@��%�P4@@���!Յ@�_�-=`�@��C�CK@�?�H�t�@����-�W        ?��(;�@	c�<��S@pq☂q@&e�è~@0ܓO�N@7����@?�>?#�@C��d�@Hk=���i@Mo��L�(@Qh���@TEa7��@WL.��٥@Z{'�L6@]Т�m+�@`�����@bt�N͐�@dT�ɧuP@fE���=@hF_ɌM�@jVy�@��@luy�vx@n��\���@po&lO��@q���>-�@r��>��@s���{@u'Xp�#<@vd���|�@w��Jb�]@x�y�,T"@z>�����@{���}@|�_辥�@~G�Y��@�\�l�@����t@�>[:�LL@��a9��@����O�@�l��͌@�+C��)@��>'�@�� o�!�@�rBJ�v�@�8_����@� K�Uz@���W�cs@��f�[0�@�b����@�1S0�nd@��ӐV�@���:��i@����Z|@�|؊�X�@�S���@�)k@���(I��@��z��@�_fhW@��In�Z@�>.�{a�@����x��        ?���f-�?�<#v��@ �:�c�@)a���<@���U@�єe��@"�i����@'�O�s�@-H?�C�@1�i?���@4���>�@7Տ��@;?�d��5@>Ӝ�2;#@AG��Cl�@C8ѝ,_$@E<�?Z&�@GR���@Iy��/@K��l'�@M���6P@P(1+7��@Q[�-�g,@R����k@S��p;��@U"+�FR�@VrC���@W�:��<@Y&J�έ@Z��e�w|@[�7 Z�@]c�W��@^�L��@`*c�5.@`��d���@a��-S@bs�a:P@c<O���\@d!�* �@d�X���@e����@fu��f{�@gI��cH@h�*w�@h�6v"�8@iҖ�I�>@j� h��@k�j5��?@lm���S@mP��6@n41+E~�@o&�{H�@p �X\��@pu�mx@p�O���@qa�X��i@q����#@rQD���@r�B9H�@sD�#��@s����@t:���@t�Z^�         ?���V^�}?�%(��SK@	2QЁL@?��@�}@ �@�e@&a�r���@-�L%UT@2��N��3@7cr�{^�@<B���w@@���-�D@C��F�@�@F�>��)r@I��Fs��@L�9�$�@P3Kj�<\@Q�]�/@Sݴud}�@UʹD'�@WξX��S@Y�=ݭba@\�@�2�@^2p�TQ�@`9]3�@a`"���@b�5�)�;@c�F�R�@d��^K@f@~8;�$@g���3�@h���XƬ@j*��ˡ<@k�n�&��@l��&�@nH;_�@o��C��(@p�1bN��@qI����@r-5���@rĲՎR}@s�}H��@tH|OK:�@u��eUt@u��3�@v�"˶!n@wib�J�5@x6�+76@y����1@y�vyX@z�/��@{}sq�0X@|S{@�f@}+$n���@~e���@~�5�*�)@��q�tX@�L��8��@��Q�k@�,��V
�@���u��@�JG�J@���"��@��o���        ?�(����?���1t7@��9r��@3��y�@ �۟�e@&c����u@-�-(K��@2�/���@7m���@<O�mV��@@�1�(�@C��_�@F�p23�@I��ګ�Z@M�6�hg@P:�rW�@R搆uX@S���Ag�@U�����M@W���N�@Y�.���@\�}Deu@^1D}�**@`7]'�@a\bF�)�@b��7OZ@c�&���F@d�$Z>Cb@f3I;6�@gxi�	�@h�\�넚@j�U�}�@kj� ��@l�s� ��@n%��@o��{1��@pz�%(��@q2��� @q�n�T�W@r��ԯ@sf��3�@t'q�cV@t�G�^@u�����8@vuD[�w@w=��p�@xD~W}?@xԎu:@y�����@zrr�P�@{C���m@|@j�@|��Z$�@}�9��@~�"Ɛ�@s�����@�'C���@��{�	@�m����@�te
�k@��v3>�s@�U�:;c�@��F�
��        ?��k3\�@��f��@�0��*@$\e�Z@.�f�-�@5b���CW@<H1�fݸ@A���\x�@F/y����@J�`����@O���s@RfQ���$@U$k��@X�x�s(@[
^F�Y�@^0(H!�@`����&�@bmZ��@d.��~�@e�9��}~@g۹�)F�@iƦAd.�@k���Wb(@m�mEzz@o�̃��@p�,r��@r3�c��@s%��2��@tD��8�@ui@�X�>@v���]�`@w�S1��@x���#[=@z-�)@{j�;�@|��N��A@}���:Pb@<h�R'�@�E��<C>@��'ʹ�@�����@�H^����@���>�@��s�@�\ҠP�@��2��@���J��@����P�@�<BO��
@��gkС�@��0�@�@�u�ʘ8@�6�o�}@��#�(�F@��= ��@��ۢrI�@�I�
���@��S�8w@�ܘ���N@���n^�@�:uy�%�@������8@�	`y��        ?��_J�r?�H{�z�@ ��buW�@R.lA*@�l� �@0�_�W�@# @�Z�@(�����@-�y�T�"@1�i�MD@4��zѝ�@7��,��@;l!�ď�@? ��n�@A^,B� @CNt�ԓ�@EP�����@Gd
��Ol@I�5��@K�@_���@M��	��N@P)bk�L�@QZ0�]�@R��)Ce@S�~�ʩ�@U�{�@Va�f�w@W���@@Y)��d2@Zj�<	�@[���%ڶ@]8䟤�@^�l6 �@`��a��@`���$@a�n����@bM����@c.ջZ�@c���@d�O�EZ�@em�jB&@f;C)�)@g
��-�@g܅�{k@h�\�@i���P�V@j\�Pb�v@k5�A�Di@l����E@l����?@m�!{%�@n�ͣo�C@o� "���@p7�r�b�@p�����@q��?��@q�rh�f@r�y��t@rzO��@r�&T��@sf���mM@s���2Zh@tU��PI        ?�<��5n?��U�q0@	��`6��@��T��@ Z����j@&�2��xk@.K����@3O�M�[@7��:��@<���6�Z@AǟW�@C���ǿ|@G	��]@J<�k���@M��	��a@P�2_�C
@Rg�eڽS@TP���	"@VKp#�@XWK
��b@Zs��)!@\��ik�k@^۱ܥt@`�#wc�w@a��JU%�@b�qr��@d-$��@em�k���@f��9?'�@h\V)�@iS�W�\�@j�-;z�b@l	���@ml�Ε�z@nԛ�cB@p ��殯@pٕ�M�@q��+�(�@rR��b�@s��ɠ�@s�8���u@t��F���@u\M ^Y�@v#�#hZ�@v��Y4��@w���[@�@x�#PzH@yR@�C@�@z!��{S@z��؟�@{�ö���@|��eA�!@}oTy��@~F >�ݚ@2���@�S��#@�i JD@��ך�!�@�EB��J@��<n��@�#��x�j@��ʃ��5@�XH³�        ?ܸ=�Iw?�KpF���@	zN1�@�ݤiB�@ Yz�L�n@&ܰ�;�@.N�c˅@3P�f 2�@7�KU
@<�A�P@A���@C��(+��@GB���2@J4:IّA@M�"�̍@P��r3�@R^*Y*@TD��%@V<��A��@XE��Ah@Z^K�>�@\�� z�h@^��W"0@`����Z@a�b>���@b��f���@dóly~@eO�{�@f�)�W��@g�4q@i*�s��@j~���i�@k��w��@m6F~���@n�=�O�_@p g��ҥ@p�hL�ړ@qn�'�5@r(íXT�@r����@s���M@tc��=@u$۬�-�@u�[Xϡ�@v��8�@wtIpĘ�@x<�8K;�@ye�I�x@yѠp�f@z�<�̪�@{l.�Š�@|;ix���@}�λ��@}ݏ���@~�e�I9@�Y�.�D@�,�.�@���'�@�C����@�oL5�c@����x��@�H�l�Z�@��-gӔ        ?�H�#S@@g�u�@H�@�
@%k-��@0Kb+Bg@6x�^i�^@=�48��@Bݽ�A�@@GC;��=l@L�ͦ@P������@S?�uG�!@V�2�r@Ya{r�t@\7ѝ��@_yE�'V�@am'-��8@c,�ȥ�k@d���Y@f���@��@h���f�@j�SC��@l���J�@n����s�@pqD��(�@q�S�Y�b@r��^�ʢ@s�(P[2�@t޳��v@v��5�@w5t/�ҙ@xho2�`�@y�T����@z�Yfz�@|Q@}d���@~�B(W�@��� D�@���ZDu@�R��h�C@����#�M@���Ўˌ@�_|���a@��r�G@��G��3@�|9�ږ3@�3�к�@������X@����Rx�@�c�J�g@�!�;SK�@���+ߦ@���6lQ-@�c���@@�')�Nt@���S���@��	��r@�yc���@�A��~��@��D�\�@�kVزu�@��^W��e@�7�����        ?�),8��?�8x�@�H@�19z��@�3���M@n��)�0@ #Kl���@%~�6��@*���&�@0/��Q2d@3Sf�<!@6�����@:,66�iA@=�z Ν@@�cޭ��@B��~n@D�,��*�@G�w0�4@I[ʠm�@K�Tk�o[@N��$g�@P<�C�x�@Q}���@R�BCD�@TAB۶�@Ul����@V���{�@X2[� u�@Y��m�@@[h�br�@\��b�R�@^��79=@_��@��F@`�M��_@a^�M��@b,�V�@b�G��p�@c�c��@d�Ms1ׯ@e}�2�E�@fYd�.��@g7�?6�
@hI�a�n@h�����@i�h`��@j�Aw<D�@k�ZV)��@l����@m��"3@n�W+Y�@oz�^�@p8�鵇�@p�-Lz@q2��N�@q���X-@r1����@r�ڙ�f0@s4��
@s���r�@t<P_�h@t����S�@uG�>@~@u��B��V@vW= ��        ?ޝ��b?��Ӏ�zB@	�~�r�d@�|��S�@ r���ww@&�N! ��@.a܁kN�@3V����@7�ID8@<ז��@A{�p�;@C�.��@F�Nd u]@J�q$@Mk=e�@Pr�b�9r@RB-B4s�@T#��/��@V/��C@Xk�B�@Z,�!���@\Og��h@^��N@``�J���@a��rjJS@b�F�S�@c�}1(E?@e#���o�@fd�%��_@g���: @h��]�A�@jHc��s@k�׈w@l����%I@n[h��U@o��D|[0@p�BKty�@qLa5�@r���ew@r�	41 @s~x���@t=�*.(@t�D��M�@u*�:�@v��x;h�@wNL�a
q@x�yp@x���@Z@y�c��@zy�K�@{H;�,�@|mC�@|��I��@}�A����@~�˩���@g�(V@�i�v�o@����.�@��j�7�@�e�<���@���LJ�j@�BO����@��f&��E        ?��8�?�����8^@	��'��!@��Z��;@ y��@'{��>@.���3@3r/���@8�S4�@=�2J�@A9><�@D�_�@G'.��@J_HIs̩@M�ו��c@P�b��@R|�JG��@TgK��hz@Vcc��5@Xp�\��@Z�Z�?*�@\����@^���C�@`�~���@aϢ�O@c��JQF@d>�.^@@e�F�i)@fǃ�IZ�@h3���@ih�D/�Z@j��$q@l �)�B@m���5r@n�m/�g@p.lЧI~@p�����@q�%v6%�@rb�7��@s#!^�[@s��,��@t���ˍ�@uq�Ր��@v:�ee�'@w�Z#��@w�b����@x��)d��@yqE�L��@zCL"��p@{�V�82@{�8$�� @|� �|�@}�C�a@~t�oA0@P"c̬@�D�vj@��#fU�@���%�_�@�d��%�$@��a�<�D@�F�5��@��Z�D�@�*�\b�&        ?�J�p�ǎ@7'��B�@<v�v@%a�T�_�@0�z�+2@6t>���@=��:�@B�r�0�@GL=� ��@L�@@P���F�g@ST�03�@V6�ōR�@Y?R���*@\lq��O@_�����@a��̫Y)@ca>\Ё�@e:��R�@g#VjL]@iВ�Jb@k �_�@m4I�/�f@oUrp_@p���d��@q�^ζ�j@sW~�@t,ݲ��@u\�),0�@v���+@w�����@yQez@zS�Y�@{��uGy�@|���;+1@~B{�~�@�J�f�@�}$d�)�@�.���>�@��D27��@��+'�T1@�P; �3Q@�
i��RI@�ƮX��@���TR@�E^'bix@����*�@��~g0@��OSc~@�Zpq�[@�$g.��@��)>���@���<	T@���8��@�]�?��@�0v�Xw@���c��@�ڍp�כ@�Y���'@�ŉJf�@�2޺q @����@���/T        ?���
�?�m:�3@֔�߷@�G+�@d�$^vW@����@#Q|Q}�Q@(T��M@-�|2])@1̫��@4���J�@8.��6[�@;����v@?>oz#�@A�����@Cw���Z�@E�.�L�@G���X�@IƩv ��@LWWd<@NP)��]@PVI�4�@Q���k0@R��ǙA@T,Z�'@UX#0g	@V��B�F@X��<��@Y`9��@ZĪ{��@\.��HM@]�	M�(B@_�(�z�@`Gɓ�qP@a�G�S�@a�}_蕳@b��<f��@cW�d$�@d �m���@d�}O@e�oԁ@f�^�oj@g^�ě�@h3�d?��@i
vk��@i�G&��@j� ���@k��	�xq@lx쒺��@mX���P@n:���+]@o�Ǚ@px�I�@pt�i̢�@p裳�#^@q]T��B�@qҾ���@rHܑPCq@r���wL@s77xQ�@s�r�}�@t(_ZZ�6@t��L�8        ?݊7���?��)D'r@	�,]�@6[Z[@�+v2@&Zks�7@-��`A�@2�`;�@7_3���@<?(���@@�L�-@C��x�T@F��EˁZ@I��
�@L�q#(�i@P3u#5@Q�y0���@Sݝ����@U�C���E@W�ϾR��@Yު�䞺@[�A�Y��@^/�7�@`6�Q��@a]LG"�@b�'���A@c��x�,�@d���LEn@f8'�K�@g~:(jY�@h��2�0@j$/
@kq����@l��ix@n-[��@o�b��a�@p}�XP@q4���v@q���h@r�,�]�@sfM�2T@t%`�Q~x@t�Y�P�@u�--}�@vm��S�#@w4'�4�@w�/}��@x��.��@y���`�@z]�2�l�@{,-_=�@{��+@��@|̡ن>�@}��G�}@~r���I@GYi�L@����%@�zG��P3@��s$ޞ@�S.8�*@��u����@�.F��H@�����`(        ?�5�ǕU?���G��@	�a��@EM���@ ��YF@&t�T��@-�h�a_@2�}�]@7{�����@<`���F�@@Ҷ_��K@C���7L�@F��`�@IĮ����@M�Ϭ�1@PD�o��@R(�w@S�z�:P�@U呺@W軺�^@Y�hm3�@\ �Kյ@^S$4E�?@`J���i@ar�}ޡ�@b���0 @c�'���@e̐�_�@fW�53"�@g�4�_��@h�~���@jE�T�c�@k����F@m~8�a@ngq \�A@oҝrp�@p�m˶K�@q\���@r�ʫ�@r�M�0�@s��_��/@t]��R�\@u#�=�s@u�mx�@v�R_0G�@w�$�8��@xN��m�@yT
�XW@y���k�@z��#@{��Fl@|m>H�o8@}D���gL@~(z'��@~�ʴ,}@�ˬ)�%@�YST�D@��W١��@�8;vG��@����r�3@���nf�@��G�}��@��[oBm        ?��V��+@I�d%E'@Ie�O��@$�� ��L@/��<\g@5��Np�E@<�ޜ�f�@B05�E�`@Fq+��MC@K%W���@O�B�%ǲ@R��d�Z@U`�tzzr@XJ����@[Whv��q@^���.@`�=1K<@b�����@dhz~�">@f=��D$@h џ��@j�B�v8@l�U��y@n��x��@p͓X�V@q*L���v@rA�F�%F@s^k���T@t����3 @u�E���@v����@x��&V@y=%��L�@zxN��q@{��^�5@|������@~D0���7@��8�}@�ph{�-q@��d9�K@��z���@�tGM�;@�#ۓj�1@��*���@��(��*�@�<Ǿ��@�����@�����x@�c���v�@��(��@�چ؛�@��� ˩@�Vj*��@�;�v�@��=���@��i�\��@�\��{2@�!"A�)�@�椠�@@��<���P@�:s���@���&�Ax@���EAJ        ?���[�?�M��1"�@ �[�w��@H�^�0�@��(��@,���U@#�N��T@(SO \"@-eW3�~�@1�hE�se@4�a��@7���u�7@;O7�Hp@>�t��ܢ@ALO���v@C:����@E;�&��@GMn���@Io�jDb-@K���lc�@M����O@P#�e�@QK*���@R�L[�#c@S�Q�'�4@U�TIS@VPFCWo�@W�繟��@X��~w��@ZW���@[���m�@]%��2�6@^�#��q@`1�w�@`�-�U@a������@bE�s��@c
��[�@c�䨻;@d�Y�;Z�@ejG�2�2@f9��6�@giЅ?@g߄xN�h@h��ɳ�@i�����U@jikCse�@kFh!��@l%{�y�@m���'@m鳴�6�@n��"q�@o���K՗@pOLL�gG@pħ���;@q:�Xp�;@q�
�^�y@r*�"k@r�����{@srݫ�@s������@teQ�@t��돽�        ?ݚ���?�^�@�ʻ~��@,G�@��@��W>@&GS*.8Q@-�����i@2˼��@7=+gX�@<OD�\@@�:��" @Cd��#�$@FS�>�{ @Ij��`;@L�]=��m@P�:�v@Q��+ @S���G*H@U���5�@W{���C�@Y�	I��@[���:@]��)_@_�s�ѿ�@a�CHK�@b9��9��@ce�-g��@d���Ǿ
@eϓ�7u!@g!*��K@hP&7,@i�uQ��d@j��R���@l8Nj��%@m����:@n�{|�+�@p%���bP@p�v����@q��tc1@rC���K@r�g��@s�hC-\@ts��,E�@u1��X5@u����	�@v��xG�@wwc;�F�@x<��p��@ym�k�@y���%��@z���4�@{a��Ʒ@|-��f��@|�*ǐ��@}˿�*O@~���3�@n�7\=,@�!%4ߙ�@��y�\J�@��e��i@�a�Bb��@���/\<@�:�f ��        ?۳:�B'�?�a��n�@����@��;Y@�1ɞZC@&p��@->7����@2��5�!z@7M����@;���&*@@�.�M�@CSR^�7@FD��%�@I^��K�@L�o�@@P�^��@Q�|���0@S��{0��@U�6A�]�@W��M��@Y�s��M@[�MB'�@]�e7�YE@`�޲�@a$^{T�P@bLr����@cz��\&@d��� (�@e�(y�Z@g*f��@hpL�J~�@i��֬K@k&�1�2@la̴%��@m�f
��k@oѼT��@p?���2@p�P'�t@q���A�@rc�C�7�@s^{4�@s�2��@t���f�@uZģ�S@vj=�@v���L9@w�(ݢ��@xp$5+�@y9�FcF�@z�U %@z�Ӧ��@{�#����@|o���!A@}A)�	�@~ϫ��V@~��"Au@�D� ��@�Je��@��	, �@�"�a�u@���7OK�@��؁U�J@�lK5��R        ?��Lv��@	����@�+��[@$Rӷw/@.�b/W�,@5Pſ�Y@<*f��$@A�3�J�U@F�g�@J�;ph]"@O`�
U�@R?{wc�@T����w@W�vP�A@Z��Uĵ
@]���E�@`�S����@b+v@��@cᅸ��@e����@gu (��@iQ�����@k:�M��C@m.�ޔ�h@o.��̶d@p���@q�nN�]*@r�Y�&�@s�X����@t�H��r@v٠��@w(y�s�@xP�lq�@y}��ԩ@z�����@{�G�t:@}�<��.@~Z��o�{@�]j]�u@�q�"�]@�ꇵK�@����3�@�e4�M�@������@����(J@�i|�I,�@��~��@����\@�|��V@�0�J�@��~K��{@������@�V/r�@�#�S,@��v_9O@���e+@�FK��@�H©_@�ż'ë@��c1r:�@�J5��@��<�@�i�ⰽe        ?�ȩ>� ?�Q��R`@ �Q?^��@b���L@+y�T�~@@<6��P@#*�&��@(+�
�+@-�c�j�@1��.�@4�N�^�@8,Lvk@;�����^@?4���@A`�T��@Cx���@E�6��@G�]��B@I�wVF�H@L�QIL�@Nk�)z@Pg*���@Q����(@R�	�B@T)��3�@UyK�s��@Vϙn@Q@X,��@�C@Y�O���@Z�g���0@\j�u�E�@]�-V��K@_]���C0@`o�2yPE@a3����@a�O>t.7@bÚ2	�K@c�����2@d]�C�@e.ߗ�e@f8�i�H@f��,�!k@g� 3U@h�YT��1@if�
���@jE��ۋ4@k&�</p�@l
 �O;�@l�T���@m�ʒe��@n�^�l�@o���@pL�Kc��@p���FDg@q=�Hu�&@q����\�@r2j-��E@r�4E�)�@s*�*j�@s����7S@t'�3/�@t�cP���@u&�����        ?����?�~S�N��@j''�d�@����@-���V�@%�Hܣa�@,�_��@2d��u�g@6�w��Y@;|�i6�@@J��Ѻ2@CA�34)@E�Zw�@H�}���@L$$y���@O|���9@Q|�O���@SL�w�b�@U-]LZ�@Wj�8�@Y"���@[.���T@]MO�y��@_y��3��@`���V�@a��z�b@c'�O#�n@dW�G]�`@e��9��@f�C@ =@h-�Z��@iS�8�a@j��1!)Y@k򹫷n6@mI��T�Z@n�����@p��`Z@p�T��@qkd�Ŝ(@r"���^�@r�z�@s��ڙ_�@tU��4�@u�3t�s@u��=���@v�UGΎ�@w^�.��~@x%�TH @x�`q���@y��j� r@z�M*�D@{SZE��@|#���@|�v����@}�sNP"@~���X%@ry��@�$ؒ��=@��^�s��@���ֲԞ@�l�,�t@��'�O�@�Jl��        ?�Ve9�	9?���Lv�@	 /GZ��@]T���@ !w�,;@&��"�>@-�fV\[@37� �@7��mT�@<�RK���@@�#~D!@C��Q�@F��gl�@I�Q�|@M@`�X2�@P^Q��f`@R/g�G�@T���S�@VkZ�@X��.@Z"��ئ@\Gѝ0=c@^{��D�@`_5ئ%T@a�iLP5v@b�U?M��@c��5G�@e't(� v@fi<��Q�@g��7;$�@h�E}���@jQ%���@k�]d�/o@m�/���@ni'��J�@o�e�@p�+!�=�@qVk��$@r㒧$�@r̀�@s�/Т�m@tL��vlY@u��d@u��<A@v�L`�.G@wbZ+�'�@x,�s�@x�����@yĄ[�SK@z����@{c,�m@|4��@�@}��@}��s@~�ފ�nw@������@�0��2�	@��s���@�
��b@�x��%�P@��pTV*5@�V�-=�@��4��V4        ?�c��A��@�[+iS@�p���@$�˃�]�@/a��k!@5����@<��2|O@Bggmj@F�D�qh@K]_/j�@P-l�&�@R�ĝ��~@U���n@X�f�$@[��A,n�@^��I){@a�D\,S@b�!���@d�����@f���]6@hj94�a@j`)6@lc���@nr�����@pGW���6@q[C���@rt�H�q@s�&j�,�@t���sz�@u�� �@w\� �J@xE81�@y}��ǭ�@z���`u=@{�����@}BP��@~�2�Jߜ@ڈ�Tٮ@��x�Ay@�A��$��@������@���?S��@�N�+'y�@�_��Ğ@���K�c@�l�^��@�#��w�<@�ݗ}}t@��ڸ�7@�U��)@�6�,�@��?�z~�@���_{Zh@�X���ۜ@�e�-̫@��b���@����Ue�@�s���Q~@�=��+@���	ʔ@�kq�oN@��Ҫ\�@�9�Gݘ        ?ԥ��ia?�����P	@��ӳ�@~9zi"@�I9,y�@VPؔ Z@#݄����@)	�۶�@.�\���@2Uk���@5�8܃�r@8���@<�P̨G@@��@Bz���S@DUᰪn@F5�m��n@Hdߡ�k@J��c@L� �K��@OZ����@P�+��V@R)��LO@St0ݳ�@T���@V���g�@W�6���!@X��.aފ@ZV\�9�U@[�W0���@]F�� ]@^�'�@`'�Ƽ{�@`�x���@a��k�@b�-8My @cS��%@d$�T��@d���>UD@eϤh��{@f��L�@g��F��(@hb�eH��@iCb��q�@j&S���@k�,�s@k���F�@l��f��@mȖ~@��@n�{:^W�@o�gq[��@pL'+�97@p��:�m@q@�R9��@q��"�;q@r9S����@r���W�@s58A|�'@s�n�;<@t4x��{%@t�R5R��@u6�\�)@u�_�ZuW        ?����Sxr?�B
1��@	1'4��@U�y�k@ }A�@&s�p1;@-��e�@2�t CE@7o1,ـ(@<OoؙB@@ǅY��K@C��$�@F�-�9�@I�Y�ޏ@L�܋E�.@P7�v��@R�hj@Sᙣt�@U�'�%g@Wџ��s@Y�t���@\=8�@^2�C��@`8� �>@a_$miQ@b�W!��@c�#eMM�@d�T��c�@f:�x�e@g�U��G@h�I�Py@j�l�'@kv`VL'@l��4�v@n4��U��@o�y����@p�����v@q;�h�A@q�f3��@r�B���@srZ�@t3�~��@t�M�@u�~��)~@v���*�@wM�R@x��RC�@x�Xt��e@y��m���@z��:�@{Y�5nl@|..�F��@}�]B+@}�{��@~��K+�@�K�r�q@�7���@��)�uw@�	[��m@����B�@���gDq@�i�a;��@��q&���        ?�X�	�%�?��h�saw@	A��V�@C�SR��@ >N�@&o�'l,@-��w��@2��rO�@7r��5}@<Sf'�a�@@�Г?�@C�M���@F�Vm0�@I�B	Tw~@L�}�iD�@P8J��2@R#�]�@S���`�@Uј0��j@W���d�@Y���ʄ@\��� Z@^4T�F�@`9�h��@a`��$�z@b��J
@c�-S��+@d�h!3��@f@
��Iw@g��'�@h��|�@j)��%YR@k��6&@l�XU�@nH���@o�f���0@p���ȡ@qK;0�@r��,�@r�a�wg@s�Y�ա�@tK�,���@u�t|@u�_���i@v�+2�@wn��&@x<�Ϳ�@yp��@y�V��E�@z�\4��@{��1zd@|[o���@}3f�O��@~�WJg@~� V��h@č�'��@�QG�ʻY@���g`@�1e�N#�@��y6ZR@�47�<�@����ﬗ@����c�m        ?�d��Vq@Qx_�ڇ@Z�a�V@%}���p0@0/"��1@6��r�@=���+R@B��7X@GrXՒy@LC�z1�v@P�gX��@Sw.��g=@V_P��r@Ym�H�fs@\�`�j-@_�%�7r�@a�n^�G@c�-W�@ea}��6@gL����@iG
�>�@kO2E~}6@me	 ��@o�0 vJQ@p�%�QW�@q��Zd^@s���.�@tIg���@uy��V��@v���_P�@w����@y+�9��@zq�-��)@{��u�@}S��?@~b��s�@��	:�@���� E�@�?��~�@�����@��E�f�d@�b��pM@�Ϡ��<@��ӹD�{@���q��f@�[(��Z�@�f��A[@���C@��ԁ���@�s�hr�@�>��3��@����BU@������@��N���@�|,.'�@�O��|�@�$��4�I@��Ks�LZ@�i��>%@�ր��Ն@�D
�"�@��MQ�ş@�!D0�X`        ?�F,K��?�V�e��@:Ґ�h@�0�9n@��p{�b@�:�L��@#�V�!��@(�N�H7@.n��J	@2Sd���@50����b@8��p��2@<?l�8�@?����Re@A�Y���$@C�D�4�;@E�c� ��@H�Q�5@J@�/�&@L�:�5h_@N�<6x�@P�d�!�q@Q�Al�y@S(��1��@Tt0ce�-@U��-�hY@W MY��@X�|O6;@Y�8��/@[TZW}��@\Ǵ��G�@^A"E�@_�T#�ؽ@`���s��@ag�P���@b/����@b��C	B4@c���@d���/�k@eji��@f?ZF��o@g�g,?�@g���@h��r���@i�m�?6@j�`��.�@ko�%�#@lU>)NS�@m= �@!@n'Ef�J|@o�R �-@p��߉@py_�sA�@p�	�'�@qm�٢�@q�oI��@rdƴ-�L@r�ۉ��@s`S��+k@s�~��@t_��=�1@t�~��P�@ubMw��        ?޽����?������0@	�O'��m@�m^숎@ ����%@' 1s�EP@.�����4@3���ڵ@8(��Pw@=0Q�ެy@AL���mm@D0IY�Hk@G@P0��o@J{��?@M��<��@P��i��@R�9���@Tw���U�@VsI����@X�1d�@Z����Z@\��7� 	@_��d�@`��~�x�@a�Mf�M@c=d�O@d;t|��r@ez ����@f�~b�@h���d@iX{nh݉@j���\�Y@l��w��@mg���l@n�*�t"K@p��L9@p�t�%��@q�!�a�@rC�z��|@s �2�~�@s�%�f@t��A��@uA�;͂�@v����~@v��t�8@w���<�@xZ�6@y$��@y�4J�[@z��6@{�p�x@|[&����@},=CbH�@}���$/@~҄���@��pޕ�@�?��@����Z�@�k��?@���e��"@��Bp9sy@�`��
a8@�ψ]	�        ?�A�ㅹF?��L@��e@��b���@;��%�,@ :4��@&l���e@-�n@2�&�7�@7v��*�@<[�z O@@�E�$4�@C�>Q&3@F��qlv@I��a�E@M>��G*@PA�*)@RT~�u0@S��J��@U�j��W�@Wܫ�ZSK@Y��@��N@\�ݾ@^;^��`�@`<=K�@aa��ԛV@b�
Y*��@c��L�S~@d��*�u�@f9���@g~Bx57@h���F �@j��V<@kn�]�
@l�w�y-�@n)O|�J�@o���-@p{�_U<V@q2�g*@q�=�'�[@r��OZ�@sem&O�A@t%!�f#@t��R�i�@u�u��L�@vo�v�@w7I*s��@x ^Ϳ��@x�+NV@y��l8��@ze�z0��@{5nSد�@|�Y�Y@|�h�ՍF@}���/@~�D����@ZI��@�P��0%@�����Z@��B4��@�a��Q@��$u5LR@�?E���;@���GFĩ        ?���?6��@��#@����8\@%Z;wt�@/��� ј@6��B�@=(H�@B��
`@F��>ej@K�uZ��4@PC�_�x�@R��{�@U����S@X�I!C@[ș�~ӿ@_���P@a-�$�QP@b�bPߟ@d�\�V�@f�lBg�k@ht5-�@jh=���@li���@nv<X��9@pG���4�@qZx�*I@rq���H@s�k�W@t�({�3�@u��R	@w���@x8��	�Z@yo��'��@z���>�@{��Xq��@}/Bt��a@~x/��T@�0���@��I�0qC@�6�h�M@������@���/)��@�B�9��'@�����V@��x��p@�aA��@��:՝%@�ԄesTG@����#�@�O%)��@�$�̓�@���+�@��[Jڤ=@�Y��ë@� L��X�@��n��@���RJ�@�~B�j��@�KY��0@����Y�@�t�7�>@�ݹ����@�G*�?L�        ?Ӳ[Z��?�8�lza5@ ���a��@6���@��mP�@��]�u@#��`�D@(�y�3�@-������@1��Y�p@4ʓ��B@8�}N��@;�h��.k@?/iz���@A}J��@Cu�4p�+@E��,��@G�t��w�@I����@L*U�+@N_�@�g'@P`<5Puf@Q�.�Pa�@R׊Q���@Tc#
�@Uk���t�@V�����@X���:W@Y{����@Z�uٸ1�@\Q�}J7@]ďTr�\@_=Ȫ�7:@`^K�a�@a n�X@a�<-��a@b��4�@cv�k�@dC"���@e%a/�@e�p��`@f�"�x��@g�#o�;@heL�]	�@i?��h��@joϩ@j�l�[@kڻk���@l���KE@m��9��2@n�z�#+J@om���]@p+cNN�;@p��#�E�@q��J�@q��L�B@r��Xk@r}c�p`�@r�i���@sp$՛�@s��*��@te�T}�@t�y����        ?�j�L�BX?��`���@�OH5�G@$�#r@��r�%@&7��G!9@-r�"���@2��od�@79 x�i�@<a�j�D@@�Z)a�M@Ck��B#�@F`@F�@I~�p+@L�?1d@P�$��@Q�0NLJh@S���L�e@U�9}��@W�8l�5@Y�a)��?@[�({�y@^	6�P�@`C(s[2@aD�[�@bo��qV@c�%�_�@dڬ��@f����@g^[��@h�G얅@i�D$��'@kN��\{@l��1|�@n	��O@on�k���@pl]�H?�@q#��$0�@q�-�O�	@r��<R��@sV���l�@t&ӪS@t�V7�p@u���*�q@vc���@w,9*�@w���@x��=��@y��e�,@z_/�^H@{0��{R@|��G�@|��[�&@}���}f@~�W5O&�@]3�8�@���q�@���}4`^@��[G(@�gL�y��@�� '�T*@�G�Ѵ�6@������;        ?ۗ�B��?�S�~0k@xG�t@�V�ߒL@q�{�@%�U���@-.��r�@2�ӳb[�@7t7 ��@;��ZRe�@@��G�I,@CG"�kx@F6����8@IP���@L��u
�@O�K��aP@Q�6�:�@S���\�@U���F�8@W��R��@Y����:�@[�9,��@]��2C=@`h��-�@a+q�:f@bVihŧS@c�\W3@d�C�l��@e���Q�q@gCN$I=@h���{�T@i���ƥ@k3�;SS�@l���0@m�[u��P@oT�b��`@p_���d@q<ڻ�	@q�5�:. @r�w�M��@sK�!~�C@t����@t�M�	U@u�MC�@vZ���i@w#i����@w����@x�%���L@y�%*�8n@zW�F�U@{)/�3��@{�("��@|еQX��@}��Ľ�@~~^r(&6@Wa͛EC@��Xc�7@���Yd��@��\0���@�d�h`5@��q�ҡ{@�D�ڶ@o@���ˡ�        ?�$��@x�Q�C�@pT\�u�@#ީJ �p@-����xG@4�0I{�@;���@A�k=�@E���n@J�A�X@NΊ5>�O@Q�34X��@T�9��@W`�;�.@ZL��H�*@]X�Y�aS@`Amp�N�@a�PHP�@c��L;��@eU�64��@g"���P@h��ċ#@j�e��`@l�<�l�@n�v�{?@pjb��@qs�~�q�@r��a�W@s�a�7�
@t��#[�@uʪ �G6@v�F�zD�@x[��C)@y<��E�@zk}ɳ|!@{�X��BB@|�C�<"@@~$�t`�@N��*@�H��k��@��Πb��@���ٝ3@�7X��-�@�߱r6�@���h�3@�5R��e@�℻{ѿ@��=�#qI@�Aq��q�@���zUp@�� X�|�@�Z�kSoX@�@��@��Gm���@���	��@�99��@���(\W@������}@�l����@�+*���@�ꇹ��;@�����&�@�6?ML�9        ?ӎ�^��?�(!�[��@ ��`@ �@+k����@	�nd�@)��@#�:	k@(���s@-����@1��h=q�@4��[�� @8+t����@;����.�@?T0�X@A�y�;�|@C�|�&r�@E�kcGA@G̢۳��@J���&�@LP}�h~�@N���m@P�4j��@Q� �G�@S��@Ta���2@U��2'n
@Wb�m1�@Xz�͹@Y�����o@[X�g�6�@\�݂�.@^Q�|���@_�G�g��@`���y��@a|K��@bH�3 �@c=�\xr@c�T�m�@d�!���@e�X�l�[@fsV���O@gQ�Q��@h1my��@ijzϷ�@i��l(@j��kw2}@k�h��u@l�;9�@m�cC��&@n�א�@o���E�@pA�/琢@p���d_@q:��,��@q�5���@r8wk�v@r��o�#T@s:��?@s�N�h)-@t?��wZ@t�����@uIm�-�@u�5��ȝ        ?�_:�D?�j�Cх�@	b�b�	@�tθ�F@ :��u��@&���@.��Į@3.V4~�g@7�i#X�X@<��G�s�@A&D�&�@Cڑ>=��@F�II�@Jx}˷J@Mf_�F/@Pr�=��w@REU{�M@T)�QK�7@V��#@X&zq�7 @Z=�S'��@\d���3�@^�ig^�	@`pc�W�@a�K����@b�7
g�@d�Ƴ�@eAD��*�@f������@g��7��@i!�Ii��@jx��0��@k���E�@m7,�)��@n��6��@p�@�"
@p���!��@qy��h�@r7��^.7@r����u@s��Xy;@t~_f>`W@uD�\��U@v�
ե@@v��V+*@w���ԅ@xr�	�qO@yC%-0s@z�?�n@z���d�@{��0[�@|�3�C!�@}lEX���@~E�n��@ �����@���@��@�m"�ғ@��}0`�*@�Lo�) @���Ka^�@�.	2���@�����Y�@��T�u�        ?��~�B_!?�+�����@
co�ώ�@nA�%�{@ ��Vy@@'��w��O@/abv�+@4 ����@8�����@=��]x�@A�E3_�@D�#d@G�-ʜ��@K"����!@N�2K�\@Q!� �V�@SR�+7\@U|��<C@W�X^F@Y.ϑX�"@[_�V�у@]����@_���.`n@a+��w@beM�`~�@c�*�%��@d�S�,�@f=�3�@g��,���@h�:Ž�]@jSH�Nc@k��ɤ%�@m+ɞ<͗@n���w�@p�at�Z@p�М38@q��;:�@rU�<��'@s�a
d�@s� ���@t��MN�@u�夳]@vUU��@w)eڽ�@w���GA@x���@y��Ū�@z�:2-��@{kd��@|K�oQ7�@}-���:@~�f�DZ@~�r����@�-�f1@�db	��:@��:C�W@�P�� S�@��E5�G�@�@��m��@���!��@�47`���@��B���3@�+%N�        ?��) ���@	�˲I��@���F:@&�ѓ?2j@1�I3�v@7ϟ<�J�@?���NXM@D�c���@H�> $H@M�g�f�5@Q�b2��@T��L2�@W�w�?��@Z�0�	_@^Rۍ5]@`�S�$�@b�Q9?t�@d��,g	@f���c`�@h��k8�$@jޛ�m�@m1��b@oH����@p�>\H�s@q�0�<@s+ �7��@te���d@u�O|6|@v�?Y@P<@x=����@y�#�c �@z����@|M�]�$@}�9'��@ �2�>�@�I`��D�@�1��U@�ôY>ަ@���f,�#@�H���h�@�����@�סd\z�@�����~�@�pjN��@�@W�(�R@���d�@��
>	`@����@��y7�/�@�q`T�6N@�NYo@�-Y�e��@�X��2@��J����@��&�I��@�^q,,�@�һC�h�@�G�/�%�@��
�3�3@�5�^�@����S!@�%�C��@��g�s        ?Ӎ�i�?� v�)�@ ��rB,�@�^t)@�ۢ��@�?I2@#�Qـ@'�pW4`Y@-epFF�@1��{̒@4��̚4n@7�����\@;hӱ t@?��N$y@Ae���@C[ۣ�@Ee�x:�@G�����@I��	��@K��Z�@N:���s@PL�jC5@Q�ק?�:@R�w;q#q@TZ��	9@UUB �9�@V����@X%("��@Yc�r�M@Z�w���u@\7EA��@]��ujzR@_"k�%�@`PF�O�@a���@a֭�
U@b���^��@cg����@d3����@eȓ.�@e�=}(@f��C�y.@g}��sl�@hV6��@i1����@j'$�F@j�Vbm_@k�8�T@l���%p�@m����c�@n�����@ojs"Ө@p+08p/�@p�%�*.@q�#��@q����q@r灷$�@r���Rg@s�t��@s�=n��?@s���!�@t|Yd��@t��8m        ?ެ�l?��Ԏ��@	��3��=@�ά��@ ���S�@'�I�}w@.��w<0�@3�P��gM@8-kk� �@=7�}��@AR�c�8@D8W��@GKu�V�s@J��C�m@M�j<+�@P����t�@R�+���g@T�m��{�@V��}��@X�T�d@Z��\��@\�l3Z @_4�:<��@`��Ϩ@a�&�As@c*G��6�@dhAO�^=@e��O|w�@f���{�;@hI
����@i�6+���@j�%�(@l_��I��@m�zb�~C@o4{�0� @pS<x�9d@q�� ��@q�`�<C@r�b4�3@sN����@t�/���@t�V��Z@u��I���@vlh�E@w8La���@xT�a&b@x�#�ZzY@y����w�@zz�m��@{O�~cރ@|&b_�@|��L{sG@}�R��@~���&�@�yQ3��@�7c����@��AOP��@���?��@��
��%@���ir@�mu���S@����X@�Tn���V        ?�1��L�&?��g9U�@	�ӱgg�@����@ �Ğ6�A@'&�|@.�Kﶢ�@3�#P�8�@8,"<Q�@=1�HC�@AL5wN�@D-��~:@G<O�L�@Jur}�D�@M��4��@P���OP@R��Y�@[@Ts���I�@Vo��E��@X}]!dh@Z�l�d�@\Ƀ���V@_�TΊ@`��_�Tr@a�m晟�@c�@DL@dGnaB@e�oqDO�@f��o��H@h s��+	@iu^�c�@jσ��7a@l/����@m�"0��O@n��6$r�@p7�լ�*@p�}�L�P@q�l�3vj@rn�%���@s0Q]p?�@s�$�h�@t� J���@u�5����@vLV1	�@wt\���@w悗���@x�qd+�t@y�0�/<�@z[��j@{0�L�ҹ@|�ŝ� @|�Z�_@}��oz��@~�)(�"&@q�
�6@�'�k4�f@��s�L�@��/S�@�xb!ݮ]@��WtDo@�[}&�/@���_
�k@�@�
�R        ?�fܿ�wl@	,I��7�@?�;Y^	@&?WŌ��@0�����@7_R��\@>�|�ߖ@C�J�Mԭ@H@�m!Y@M;˽�E@QH8��X@T	*e@W 2�g@ZC	g,�@]��uX�\@`~���|@bG�U�%@d!fϛ�@f
�.Uc�@hfn�H@jlV�G@l"���v�@nG=�@�:@p<�j<M�@q\GKqē@r�5Z��@@s�B���@t�=Z���@v�Ūt?@wU0���@x������@y߆5cc�@{,CH��-@|}���@@}��}@.��-�@�G)�a��@����=@������@�cM���@�M�R@�Մ�J�n@���6�@�O��@����@��"��@����@�[��vvJ@�#���L@���txN@��4�u�@��+�C]6@�Sܫ@#p@�$B���@��X��k@��;&@���;��@�;D<�"�@���3Tr@���8g@���=v\C@��>�+u@�`��ʵ*        ?�x!�['�?��!�@ ��R�#@�/H��@��-M8@���ln{@"�b� R\@'�6ۼs@-���@1a��![�@4lv�� �@7�,�$a�@;�M-Ǧ@>��d���@A!��X�@C�݉Hf@EE�x-@G�M��@I9Q:�@Kh�vml�@M���eҢ@O��Q��@Q)@�K�@R^JR��@S�3���@Tܣ���D@V%e9�O@WtG�:@X�j\�@Z#��n�@[��F�4�@\�<��<�@^TP^��@_��ͺ�@`�i�ma@aYL`�@b����@b����@c���X�@dc�n��Z@e,+B,v@e�x]�Qz@f��iY�@g����/@ha]T�+�@i3z��y@j{`�_@j�F�-�P@k�����@l��E��@mi����@nE�&��@o#��g�@p�E�!@pr�o\d@p��r�q@qV.B�j@q�"�A]@r<�B�@r�.5��B@s&>K8	�@s���ݒ7@t^�%�e        ?�Ey�e�?��96:�@��v�Z�@�̛�	�@`�Xr��@%�)�^l@-�x^�@2�k�ݭ@6��^ӓ@;�-9H~@@p��y@�@C0�"��}@F #�:*@I0ÇS�1@Lm0�r@O��H&=@Q��V+��@S�g'}|@Uh&!�|@W_i�I��@Yf��Hj�@[}8���@]��An��@_ֿ�+��@a`����@b4,��w�@cb���\@d�F�K�@e�'�<D0@g���~@hY�[�9�@i��R:ټ@j�Y�-�H@lN3{��@m�"6&�@o
�ߴ��@p8O�̦�@p�q=N�@q���#=@r^b��1�@szv^�@s�ݔ�]�@t��C1&�@uY~1�K�@v>Ff�@v���H=@w�_�uUb@xs��zO�@y>�Jb�@z|��*@z����@{� �kĽ@|{���U@}N��Y��@~#}$�Db@~����@���T�4@�T�G��E@����s`�@�/q\U�@�������@�F1���@�{z��+        ?��j�w?���F�@��p���@_H���@�T!��@%�Z�QJ@,��c>�@2/x*Zq�@6�S�ȧq@;1J]��@@�Bl��@BК����@E���ͩ�@H���:�@K��*1��@O, W	��@QP?�ql@S҂56�@T�-j��@V�� ��@X���ӭ@Z�~t���@]���0�@_/;���i@`��V��@aԽ::��@b�0�P{@d+�Je"�@e`��2�n@f�ͻ�R�@g܂nUb@i"��n�@jn�C��@k��:0[@m`5�WN@nq��&��@o�O��@p�� $��@qP��P�<@r��cL�@r�3��ʆ@s|�>�wr@t: ��'<@t����=x@u��ĘB@v~�1E@@wCr�@x	�J^0}@x�^5羹@y����$@zhl��1@{5��}�@|%(4@|ծE��@}��N�@~{����:@P��!`�@���^� @�vfj*@���mn�@�YG�X@��$Zx�G@�5�Bp�        ?�+�F"@���D�@�	�{�@#l$ �x@-<eF|�@4`xpV��@:�zW�"@A�u4�@E�)�@T@I^�^ĖC@M��,�@Qk5\�\{@S�T�0�.@V�
��C�@Y�����@\q���X1@_}ĳ���@aRŜm�%@b��ۤ�F@d�׼) �@f\��^�@h"4^Q�@i��E�1^@k�n�L��@m��(:"}@o�e���@p�|K|@q�b��P@r�?�Xw@s�� ';e@t��Uzޓ@vh��@w$\�Ԍ@x@���V@y`��r�v@z�kI��@{��~x�@|����@~I]ҹ�@7��C/@�6���@��D"w��@�o�Ė��@���m2@����H��@�Q�Ҙ�@��?��W@�����z@�@=b>~M@��h��@��g��p�@�:]>�o�@��ܧU@�����!A@�?z.f|�@��-�J/E@��O7&�@�N��3�@� ����@���2��@�h�i�@�+:�@��?�c�j        ?����j?�s�e�1�@ 3�h��@���t5�@6�C�d�@?7���Q@#�e�s@(�Bl�[@-e���7@1��_Q��@4��<I_E@7�$ȑ��@;)oH�Q�@>����O@A+��_��@C��a�@E{z޸ @Gd4p|@I/Sg�@@KY�xP�P@M������@O�ʇd�.@Q^3a
�@RM~�h�@S�����@T�f�Yi	@V�&�s@W]���PI@X�u��=@Zk�j�@[kH���@\��
Z��@^<($ҙ�@_����@`��#:�#@aOC��
@b�Yz��@bҕ��V�@c���C�@d`+��ў@e*�cv
�@e��'2�z@f�?�b*�@g�1���@hmAy@��@iC�j�Q�@j^�Y!)@j�:�.�@k�9X�W�@l�O�O��@m�s.3l@nw�ُ��@o\����@p!�.�O@p��=E�@q�ba[@q��X"8�@q��<�@rr|���@r�� "K�@sf���@s�JNP��@t][�F�        ?�Ot�4?��N�`\@�x�@�h�G��@����@&��"�@-2�ިH�@2�g,�:X@7	b��p@;�F�)0@@��69!�@CF�u�y�@F5����@IM��v�@L�"h�@O�k��=�@Q��E�2@S��l�y@U~���.�@Wv�R�2�@Y~kq"x�@[��Na�@]�0�y~@_����;@a���@b<��lX�@ci~Ϯ;�@d��Z���@e��^�@gx��@hTC��x�@i�&���@j����Q@l:�L�&�@m��-���@n���f@p%V�W��@p�#�fZ@q����@r@B�0�@r�;��:H@s�����@tmy�3�@u*�ՠ�V@u��rN�@v��E�*@wm���@x1䬉�J@x���`�@y��h�@z���D�@{RJ	eV�@|����M@|��˜�@}�Yz\w@~���Zo|@Y����@��߿	�@�d"��0@��Y�@�T%
F.�@��R���{@�+?��        ?�උ���?����2��@�?�L�l@�Up[@��e�I�@&:�͏�.@-�C��!�@2ҷ;�F@7O����@<1�/$�!@@����ۃ@C���~t�@F��u�g�@I�1�5�@M  � ?@P<i�ڸ�@R�M���@S���9�"@U��'
CW@W� ��@Y��:J�i@\"�� Y�@^X�/�@`NR�.��@aw�
��@b����	�@c����=@e<�ƶ@fb�O�'@g��z��@h��wöB@jU�u{m0@k�4�lp@m�Њ_�@n|Tg�>�@o�|6��$@p���@qi�x/j�@r'����@r�k��@s��iS�@tp�$��S@u8��t-�@vV��X�@v�A�g%@w�C���@xlO�V��@y>W���"@zM���@z�"u|A^@{����@|�=N��@}tntSj@~QQR�p�@/�`K�@�����W@�x�EL��@��ui�A$@�\ҿ �@�����=�@�C��T�]@��@p
�@�-r���        ?��3��@M� �@@}�3�@#��f��@-���*hB@4�|M3��@;`�x��@AgĒ)m@Ex��+@Iߕ�gX@N��y��=@Q�%�bo�@Ts �%��@W;����(@Z%JLS�@].����@@`+,�ʩ�@aͶ�&��@c~k�Ze@e<����@g�	��e@h��g?@j����@l�A8��@n�4��@p^Kt�g@qh	�R<�@rw/��BT@s�����@t�%�R�_@uó;��@v�%�>�@x`��}@y<F����@zm�q�r@{���i�@|�!��@~���?�@`$j@�S��粅@��s�t�@��Da�_f@�K�2�@��둓�r@���՞��@�Tjs�Zu@�j,�@����/@�o�j�@�&O�J��@��q��h@��`�Y��@�W��C@��Ȱ��@�զ����@��wL]]:@�Z��8�@����~)@�梱�}@��Ҩ�G�@�x�KۼH@�!�ׇ��@��1���        ?�?�V��?�m�(��@H����D@	��Ϊ@��W��?@�/��;@#�Ϟ�kH@(��eS$@.J��bٍ@2!f� �"@5N�T1�m@8���W�@<4ٗº@?玪*�^@A��|��@C�Vo3@E�V���@H-@)(�@JW��6`@L���{��@N�����f@P�$���@Q�o^3@S2mF:�@T}u���@Uρ��tS@W(i^�@X���$@Y���@[Z�ڡ�@\��k@^E�=��@_�#^T�f@`�0~�B@ai��͗@b0���@b�,t��@c��� �m@d�F����@eip^�/@f=7C��"@g���.�@g�t΂N@h�n2��j@i�����@j��r���@ke+�)�@lH��:@m-ެ���@n/�>�@n�qO�1�@o霛�x@pkVʦ�@p�����@q[-����@q�q]���@rN�*��P@rɆva�3@sEJ}o��@s�ֳ���@t?%;T+@t�1X@u;��b�        ?��9�r�?��~W��@~���=�@»��y6@L��u-@%�'��aG@,� �[�@2y�r_@6�?xfL@;������@@_���@C���&|@F�S�@I8Y2ϟ@LOy�9�@O��z�@Q���w�
@Sm��ds@UR���@WH��xG5@YN�(l��@[dP���@]�bΌ�@_�G�%@`�p�?@b%iư@cSK5�~�@d����k�@e� Μ�>@go�+��@hH�J��@i��7��g@j��q^F3@l<r�zN@m�(_�®@n����@p/$YV�4@p�52&��@q���$�X@rU�;Y�@s�9��@sΆ��M6@t�G�EV@uO��y�Q@v�ü�@v��k���@w�2o�?h@xi'���@y3с��@z $�O`�@z��N�@{������@|n��}�@}AA�@~)jO @~�p��'@�1-��_@�L�"#5�@��Z+�@�&��ߖ�@���2���@�W�O%N@�r���        ?ۦ�1_?�Z3����@~|<��@�I��@{��w�@&3��~@-<�0���@2�5�b�@7�	?��@;�p���@@��:���@C]�Ӗ��@FS�1╠@Itx��</@L�����:@P;S`c@Q�k6H<@S�5F�Tz@U���%T@W�:/S��@Y�Z��zC@[��W�t0@^ A�P|-@`1���3�@aZa�y��@b�~h���@c��AI!�@d���R= @fD/ U3�@g�,�:�@h�e�k�X@j7�zf��@k��-�@l�ݠ���@n`~+~�n@oΥ��і@p�W3D�@q]�G��,@ry�8@r���ژ�@s��ُ�W@th7D�}�@u0���i�@u���Tu@v�+}߷�@w����"@xjFQ�g@y>4���@z�޲�`@z�G�@{�M5�~�@|���s�@}~oe��@~]��V@>١�jO@��vD�{@��"3�0+@��C����@�j:�N�@��(�4�@�T�N�v@����:Hd@�B�-�        ?��$�&L@"� 2�@!�V���@$t����@.��Q �-@5|	ۜg�@<h�;�ǋ@Bw��v@FH���oD@J�oO�W@O���(�@Ry��M@U9r8�U@X&�mWN@[#<M��@^JM8oh@`ȈUO5@b{,�y@d<�}�bj@f ;pL�@g�z D��@i� �#ؔ@k˧^2�@mϩI��@o����w�@p��21s�@r�t�]@s*�<)�	@tIf��d@umM��ѧ@v�S�i�@w�Y� Uw@x�?w�z@z.�~��g@{k'U��@|����,@}�����@:z�.ڈ@�D	��y\@���_�3e@���̓Dl@�Dt�	>�@�����1@���m}�@�U�5Jf�@�
���@���x�@�w]�P�@�0�4j@R@��p�R�@���N�P@�f �1��@�%��$6~@�������@��ol�ep@�m��SX�@�3!4�@���Q0@��lڟ�.@��-V'r@�+�Q��@����i�@������k        ?�~�Q�?��A��@j�~D��@A�&�e@�C|[��@$���@#���C@(�a��ӟ@.zy����@2;Ӣ3�k@5ka��!@8�? �(�@<S�(&�@@{'d�J@A�|6�d�@C�{�(X@Fg\��'@H+ųι�@Jb&r��G@L���*@N����N@P�܂�B@Q�oB���@S/X@Txe��gl@U�i5�|�@W9e�V�@X|�y��@Y��L��@[Jӂؠ�@\�.	��@^1�[�@_���5�@`����#@a[�0�1	@b"m�5}@b�=Ew�(@c���|p+@d�< iZ@eU�^�@f)�@f��}�M(@g�[
�b @h�x>��@i����(-@jk{�^�@kLK�+�@l/=;� �@mA�1y6@m�K/�=@n�L�(@o�8�Q;�@p^/�9*@p�W=d|@qM����@qƸ^e@r@� R�p@r���X�
@s7[�YΠ@s����@t1L����@t�}G�@u.y?�st        ?�P��=�?�h�؃d�@
a���	�@Vd�&�@ �M|q@'~�dF@/6J�>�@3ς��&�@8|��X��@=���<�F@A�����@Dl^>4f�@G�=,��@J��sjm�@N,diZ�@Pޣ$'��@R������@T��
�@V��	�o/@X��7���@Z�g�X@]^�b��@_G�,�@`��&
q@a�V�?�~@c.�,��@dk(Ɣ�@e�����@f��_�@hFP���@i�[}�ո@j��E!�@lVm͊c@m�c�3��@o%�Z]��@pJp/]�x@q\}/�@q���n@r~���@s?[���@tܲӬ�@t�W���@u����I@vT��<*@w�����@wꪼ�+�@x�28
�@y�h��@zW�4@{)��M�@{�:��@�@|�'ot�7@}�p!��@~�
���@X�/�@���M,@��DМ�@����ys @�d��Ci�@����%@�DEnIZ�@��<9�@�&_�[�        ?�t.��(�?��c�G@	'B��A�@dO,ذ�@ (?m�[@&��Fۼ@-���M�@3!ɱ"@�@7�!��T�@<�R;\�0@@�Wr��@C��	 ��@F�8�x��@J	P�� x@Mb�0�Q�@Pq��@RE�^A^@T+�o�S�@V#vd��@X,���l@ZF"�wG@\o�!� @^��p�P(@`x��@��@a��JeQ@b�:����@dd7y�@eO&�u��@f�O��@gᱍ�S@i4��bm@j�n ,z@k�o�;߭@mM�*��N@n��?i�@p����@p�Sp9@q�.�ׯ�@rF�[H�W@s}�Q�@sʚ�\�@t���B@uWz��ޑ@v!&�=1�@v����
@w��� ��@x���{G�@y\z�)�@z0L��@{���@{ݰ/I��@|�0ч<�@}���+#,@~o��T0@Nx^�#�@���@�����@��}B���@�m.G��\@��@�x�@�T�<��k@������@�?~x��.        ?�(���A@َ���@�^R��@%�}M\@0Y��:@70�p�@>lH�F��@CV�֮�@Gܒ��R@L���F��@P�kw�@S��}�Q�@V��C�8�@Y��찍�@]�l���@`8X��@a�ʹ7x@c�j�re[@e�Y��1@g�_Su�@i�� ��@k���+@m���b�@o���</`@q��4t�@r.���@sT.y�\�@t�N��@u��O�3w@v���bE�@x%-W�jp@yf�U0M1@z�x�^}@{�;Ė@}Iv-%�@~�}Fo�@��c�@����t�J@�\��	�@�+ �D�@��Ro%��@�{sf>�o@�4���H@@����{�@��_�;B@�k�L�@�+��wS7@���n�@��?���M@�x-�+�@�?צ�\@�	9����@��P��+@���U��@�o���̝@�?���T@�t�Q,�@��̬��)@�\�3�yf@���n�@�4��T@���e#@�H�U�~        ?�7MѨ��?��f#y�@5�b��6@��N*C�@��y���@ʑ�N�_@#���k�`@(�;�-��@.,���M�@2&�jp@5>`�� �@8��'&�v@<&�)��"@?�m����@A��1��@C��<s@E��t3^�@H&��iq�@Jc@��h�@L�N���@O�Ĉ�@P�gm��@Q�����R@SEHsLu7@T�Q��� @U�{���@WD���;�@X�c�8�"@Zʺp|@[���ƣ/@\���{�@^r��k�@_�5��@`��i 3@a�M��e�@bN�R��@c���@c�����@d��#L@e��zJ@fd���T@g<�D!�A@h)�_�@h��1��@i�4
�#�@j���,%�@k�e�G[�@ly���k@m`\�1��@nH�M��@o2�� �^@p?��ZI@p���?��@p��^�&@qu�.u
@q�&�p@ri�bZ'@r����O�@s_;��^@s�a+Q�@tX<෤f@t�˩B��@uT
��N        ?��R&@)?�iXw�P@	Yx�M�@x�I�N�@ .>��@&�e�j�@-��)�-@3�E�a�@7�f�D�@<����?@@�:�x��@C�F+0K@F��Cb9�@I�¦0��@M=�1|c_@P\�=k2@R.�.*�@T�iaD@Vn����@X�\�f�@Z&��'Hj@\O&��@^�� ��@`g�1�j}@a�aB�`@b�@��8�@d 7G��q@eA���q@f����bS@g֧4��-@i+T90 @j���V^�@k��6lyC@mL0چ�@n���`)@p���D@p��&vP�@q����d�@rM����w@s����@sՋ4v@t�����@uf�f�@v1���C@v�+L��M@wξ{j1@x�H},Y@ys�H��C@zI\�/@{ <�6��@{�0���l@|���^�@}�L��Au@~�b_p)�@n�;��@�'�DG��@��#����@�V��<�@�~I}��@���k5%I@�f_���2@��{JD=�@�QFΝc�        ?��a�J?����@�o���@!⊐�@�����@&/�F
�@-j�P�s@2����@74��@<��t�@@��ߟ@CiYPu�@F]t�S(@I{�_�\@L�Q��2�@Pi@Q��Uر@S�|x���@U���g@W��l$\�@Y���P��@[Ծ�C�x@^�t�'n@`\pt9n@aB��1��@bn,T�|�@c��l�@d׽)�I@f��ͲI@gYN��z@h�����@i�l
B@kE�ψ#@l�� �UT@m��:�o@o_�b�8B@pc�G�O_@q�]~��@q�1��@r���i�$@sI3N�@t���V@t�X���@u����@vO3�l�@wdMT!@w�Y��@x��	F@yr\@*t�@z?O��J@{Ӗ��@{��,�Ǽ@|�^BZ�@}�N�P@~V�m�@,S@��@�����@�m�I��\@�ڠ?0X@�HC0�@����I8@�$����m@���!���        ?�Rʜ$@f���j�@a;siu�@$��P3��@/(h���@5�wE��@<��)t�@B+�R�j�@Ff�_���@J��lD��@O�ӊ��2@R�9�vc�@UJR��@X-�q�@[3o��;�@^Z
(���@`��s�O@b�/���_@dB����@fw���@g���cu@i֫�ON�@k�K�+��@m����#@o�v��a�@p�"=�#�@r�(F@s#S�ϼ�@t?�L亿@ual��@v����@w�d�  �@x�>*B-@zCU�!@{Q|2�l�@|�ݮ�
@}��r�η@�a��@�0O�,6@��+28�l@��p�h@�*wD�@��̓�y�@�����"@�4��s@��
4Xb�@���U�@�M��K@��8$%@��f*\_�@�too�j�@�.���&@�ꓧ�f�@���-��@�e���h\@�%WZO@���!��@����3@@�jژ�r�@�.���/D@��2�}�.@�]?Ղ��@��첲��        ?Ԩ����?���:e�F@�W͹/�@t�򈦤@��g��S@<��@#�h�`P�@(�#k&�@.kU�;�@2+��#��@5Q���<t@8�����@<!O-@��@?Ǚ�$c@Aʗ,o�@C�B��{9@E�!R_��@G����?@J��}@LZ�|<:@N�$���@P�x���@Q��>�@R�NAyz@T;�l�/@U�:Q):@V�@���@X1�X.M1@Y������@Z���x.4@\`�c��[@]��	�b>@_HpTږ@`bk���;@a#T@f�W@a��TV�}@b�qa�@cu����7@d@�r3��@e��~G	@e�w��x�@f���!XH@g��
�@h[����@i42ỗ/@j�ݘ��@j뛧�Q�@k�D�H�@l�נh�@m�Mq,�@nq��Q�@oW���P@p뒉��@p��	U�@q
�zqH�@q�w�v? @q�$3��@rq�����@r�/���"@se����@s�ȩP0�@t\�QR��@t���Ν        ?�o�>�?��V�ųo@�d=.5�@��Im0V@I�=�@%�\d���@,�����@2t�o'�@6�s>3�@;��&�@@Y-q�z�@CAf/[e@E�3q@I���^�@L?y���y@O�U3��&@Q�!<��@Sb K�@UFI���@W;VA�@Y@�w�@[U�z�c�@]y�֚�@_����ۭ@`���I��@b}.��@cL���N�@d�o|��!@e�t����@f��rX]@hD���l�@i�k!~)�@j����F@l;����@m���w�1@n���h-�@p0����g@p���!�w@q�H	Mp%@rY�ؗ��@s�@^�`@s��֖s�@t����@uZM��@�@v��s��@v����NU@w�$v
�W@x{Q;�^�@yH`�` �@zJ��@z��� ^@{��"͞�@|�Ь�&@}d�G2�M@~<��<��@��"��@�މqض@�f�L-��@�����@�E���V@��d0��!@�'͆E�@���O�.        ?ۆ��h<�?�5�*fC@Q��\o�@��?�7�@40�
@%�SwE�o@,�J�lN�@2p�^㔂@6���{��@;���k�3@@X��Jj@C���%�@E��g���@I����@LCr��@O��Om@Q�gh���@Sdd���@UG�[;ކ@W;��i@Y?f���@[R.�cԙ@]s�w6@_�)����@`�4��@bp&q5@cA��yY@dr�(�@e�����@f�6dn�h@h+cU�@is��?8�@j��͙S;@lٰ=QV@ml��l��@nɓ5�2 @p��TVO@p�{QA_�@q}��g3@r4�l�>�@r�5R�W@s�BF�r;@tfC��E@u%+B��@u冿�YO@v�����i@wk[8�l�@x0��yd$@x�G����@y�a��_�@z���!_@{S�Q/�	@|�)O��@|��W6@}��aZ'*@~�G�&�@Z�
hK�@����@� $w�@����@�R��ע�@��:�`@�(�w��        ?�a�e�r�@�."A̢@�WC��@$��m�8@. ����@5$Cԍ�@;Ņ�v%@A��9Hr@Eñha�o@J6µ�g@N���dx@R���.@T�T:��9@W~q���A@Zm�(\XS@]|/}��@`T�'O�7@a�����@c�����"@ema6�6*@g:�\�K~@i_&#�@j�F?aa@l�0+��@n�q��\Z@pyZA�]+@q��3A�C@r�t�*�f@s�~���@t���a@u��Án@v��3s�U@x"��'��@yM����@z|3���a@{��/c�%@|嗕�� @~ I
8"@^f�I�@�P0FN��@���.K�9@������@�=��=�@�契��@��%?i*@�:7��@���m��@���z���@�D{���@��~�F�@��쟇�@�[�@Ċ�@����Y@�ǉ��(`@�w,`��@�8�s)�
@��O�%�@��2���@�l]�9|l@�*���B@��|{B 0@��e��`?@�6��AWp        ?�3P�^�?�o���@��bT	@,��U��@qh�?5@�4��K�@$5c�F�@)k�JY@/S9�Z@2��+{��@5��ǲ�@9#u�]@<�_�M��@@4b�h �@B#�jAh@D&�۫�]@F;���@Hb�h{��@J��I�Ĭ@L�m,>�@O;��Qθ@P�����z@RW�H@SPd��f@T��Φ5�@U�#C�@WA�M>W@X��U7:�@Z�ܵq@[m�61Q�@\����O@^S�:7�@_�-�#R�@`��<8�@akEa�G@b1�6�@b�G��ּ@c�����@d�JO@e`ZHn��@f1��vl�@g��id@g�l1b��@h�K P~�@i�-V?�@ji�4@kFΆ|�2@l&t
�#@m�-��@m�3�@n���(�]@o����?@pOŨt@p�3X���@q9ٽ�B�@q�G�<�u@r'~.<tO@r�{���A@s=��՚@s���D	@t��t�@t��R��}@u���#$        ?݆���:9?�>B��@��Cb@'o��v�@�I6��@&F*vIל@-�1� �G@2�$T���@7D�Z��@<#�!��@@�C��i�@CsH�֕p@Fg�~��2@I���xLP@L�Ȼ>��@P�F��@Q�ˈ�'�@S�E٬�i@U��c���@W���	;@Y�9}�@[����7t@]�u��?E@`M.��@a<���\Y@bg\ı�#@c�n)�>}@d����@f��qML@gQ{���@h�/U_�P@i꛿S�@k?��w�@l����S@m��F��T@o^NM��L@pd .��@qE�3�@q�����@r��Ш/@sO}��@tt*<Q�@t��� `@u����8@v]A7m@w%��@w�d;��@x�Ǣ�/�@y��:$	@zZ�h�)@{,�༐w@| @�� �@|�q?n�@}�L��@~�Ȇ��@^���I�@�C���@���s��@��-6�@�k8ș~�@����/�U@�Mb jxx@��u�"��        ?�$9T�.?���$��@�E���@\�jcΐ@�����}@%|}9�=C@,{֚D��@2'�L�i@6u�}�l@;#{�D�@@!���@B�-m?�@E���Ɠ@H�>6F@K�:��@O"��*�@QCFBz�,@S�:ϘZ@T�D)s��@V�ɤ�ݠ@XȆZ��@Z��[Щ�@\�b�vUs@_z��1�@`�Z�ej?@a����cU@b�V�A[@d	ĐfY@e9�F��*@foq^���@g�N
^�@h�E���@j/--:�@kx���{@l�+��@nƳ��V@op��(��@pe��=&y@qt՞�@q��*0J�@rzFu`�"@s/l�u�[@s�O��	@t��D�@uY[ԕ5@v�Ck}M@v�>�h0Q@w��
m�@xQr5I��@y4oL��@y�Z����@z��N4�v@{`�{ZG@|'����@|�i�Ĵq@}�4�}X�@~�EL�V@Q���/�@���JX3@�v��Wa�@���"nc�@�GA����@��AK#��        ?�]���@�:p�Ab@��	���@$��E��@.&L�0�@5	Z����@;�I)4Y<@A��ê+a@E�K&�yo@JU4TӍ@O$�[�c@R!]����@T��"$|T@W��t���@Z�_<?,�@]÷lG��@`Y˺'�@b,�F@c�~�۵@e�6��@g�L?X��@il��|�G@k]�&�4@m[c�Ia�@od�-��@p���Zl@q�XY�@r���_�@s����@u�:Ԭ�@vB�Q�K@wm(q���@x�*���6@y��t�@{9	1z�@|E:�x1@}�D��,@~���d@�
�V^<?@�����&@�Z�wM�@�SX;;�@�����s@�`�&�$�@�廎>@�����v6@�v��|6D@�,[���@�㋡�l@��\��D�@�V����@�Ö-O�@��Len@��Y>�n{@�O�8��@�����@��q�b��@��fqK�@�`Ʒt:�@�(�U��@��U�u@�^`��d@��
�%+        ?�Xq?Z�?���o��8@[��@�X�f^�@|94O�@�d"��@#~�f�@(�L�
U@.&�+�Yn@2��Iw�@5;�g��T@8�� �o4@< � �$k@?�'e��?@A�`oܺ�@C��#�@E�	�SBb@H���s@JU�%�@L���_F�@N��1".�@P���p��@Q�g�Z�j@S;��-�@T�X,���@U�	���@W;� �Z�@X��B�=�@Z
p��@[{�z_�@\��SZ@^q�qMA@_���S��@`����/�@a��M�_�@bR�/w&(@c +��@c�'f���@d��I=��@e��tC@fo���W@gJH�	�@h&��ҧ�@i��3#,@i��& @j�Nf�@k���|D�@l�2ߕv@m����@nlm�XyE@oY�3J,@p$�M6R�@p�e'j�F@q�>�zm@q�h',6@r���C�@r��M`�@s���"�@s��6��@thp�#�@t��|8<g@uF�k�@u�t�\�        ?��r�t8'?�IuY��@	>*cEYA@e=��1>@ !��^��@&�"{�<@-�Qd��7@3�W�E�@7��6C�@<{�Y��@@�x�PG@C�	�P\n@F��)�".@I�`�7]�@M-�s0qG@PSE0�N@R"t�d�!@T�꺤@U���<C"@W�h��@ZxpÉf@\2R�3�@^et�^*_@`S�S`�x@a{شp1U@b��0�O�@c��I�`�@eLR��@f`��}@g�H}�+@h� eR@jL����Z@k�t˹sC@mp�X�@nl�NHj�@o�)9;hB@p�J��!@q]mխ��@r�t� @rؾ�br@s���x@t]� @u"t$XO�@u�����@v�e�7*@w~�&��
@xL5�@�@yr�X~@y�2MNk@z�Tݸ��@{���=S4@|j!{�2�@}B���@~j�!�@~�����7@�
���@�X���$�@��<Aw�@�8�q�\@���q5	?@��p!ť@�����5@�	�k2A        ?���2�?�i�V��N@
�V����@�c!�0�@!�"_�@'�g��
@/��^�0@46{j�y�@9����@>9{YR�@A���@D�,a /�@HP���@Kp�`��@N��E��@QQ<B�S.@S;�����@U9��o�@WI�|<�@YkW&r�@[��A@]���@�@@`�YŊ@aJ����R@b�����@c�/���@er��d@fUfA{~�@g���5�@i��Æ�@jb���@k�\��y@m4��*k@n�S
�t�@p	A"@p����@q��C|J�@rO�$���@seo�x�@s�B1k�V@t�dp�2�@us�Ħ"�@vBA��*�@w� i�@w�2��~@x�k<L%@y�9���@zj6�U�@{D�B:h@|!{�e�;@} �<ڝ@}��U3��@~���:�@�Ӓ[��@�FN�߭@����#I@�.�;��@��
��l@�==�z@��6�؜�@���D�d@��ho�U@����\(X        ?��(Ht�@�ɟ�j�@�"R�5@&yg;@0�����@73�^��@>��(hS@C�~AL@Hx�3/�@M��	@Q1)偓@T9��y@Wם���@Z(1$�@]sG�We@`qm� l@b:�C�<�@d��0�@e��V�D@g�~�Ի@j4�U�@lt���{@n=ʠ�ڃ@p8f��R@qX���@r)evM�@s�ק��@t�!Z��#@v4�V�@wW)��ԗ@x��O\Y�@y�4!Vi�@{6
�"@|�#�T�@}�x����@D��'�Q@�T�g�l@�	��(G@���p��f@�y$��#d@�4��!@��/���$@���Ш(�@�s��<"@�7���C@���YM�1@��vU`��@��2(���@�Z��(s@�(%Yiv�@��E4�7@��[yph@�����'t@�n�o�:J@�Dw��L�@��� v@�����.@�g}֍�N@��ko��@�D�)t"@��{]�Ea@�#�q���@��k���        ?ԫ��W]?�~9L�@�Z!�6�@s$MW�@�1&@.�J�J�@#��eu��@(�;O�}^@.QdS��@2F�1v@5=E���@8��a�Z�@<z[z)@?�ct�L@A���K�n@C�N��@E�o�ꛃ@G�h���f@J��@�r@LGe7��@N�G�	*@Pz^^ �n@Q�#�O�@R�6�V`�@T4^5�@U�f�18N@V�"HY�5@X,m�5P#@Y�1z��@Z�Y���@\^�k���@]�a�D˨@_I�Lkξ@`d8d���@a&Nq�� @a�4G���@b��Z2R@c}R�d�@dJx�@eE�G�@e�jE]2@f��	�U@g��U<p+@hr�����@iN��+"k@j,�6�)6@k��5�@k��1yK@lն�i@m���Y�@n��q@o���^�@p@EQS�@p�W^VA�@q1w�DH�@q����X�@r&���@r����)@s 4ӭł@s�b' �Q@t�󎨎@t�����@@u�C�V        ?��)
�?�W8#�<@	L�O�@oxR�J@ '�s��@&����@-��*�@3��6��@7��'�@<{]5z�6@@�-8� {@C�<�@F���"W�@I�Q[�@M"\vF�e@PK:t���@R�9.ч@S����pj@U䎼z�@W�ʳ��@Y�"�(�@\���d]@^=�Y�@`;��#m@a_��l�@b���@c��DLF�@d�X�@f.v�L,H@gq��@h�=�8ݧ@j�BAx8@kY��W�u@l���K@nR1��@oqab�r�@pl%��@q!�ʃ@qف��\c@r�o��0�@sOlJs�@ti���@t�ZR5#�@u�2�|�N@vR��k{N@wdW�@wߤ�1�@x��2�r}@ysA��R@z?�AHO@{_Mo@{ܿ;|�@|��f��@}��}�X@~S�;�)6@(��}�j@���{�@�kQ<\V'@���[@�D�5���@��p�<T@� ����G@��]���        ?ܚ�8�?�/��(@	[�4b��@���鉷@ G��@�@&�|a��@.5m�N@3C��s�)@7�̷`o�@<Ԝ(�M@AIƾ��@C�><�b�@GA~�@J8����v@M��t��@P�M��o@Rg���"@TQlw���@VM"s/4�@XZCv?�@Zw���'�@\�?ь@%@^�8���@`���@a���@b�	�@d2�<>@es�\�>@f����*�@hޘ�@i[F���@j��)��n@l�S�y@mu5A�KP@nݻz���@p%�%wc�@p޸ڇ�@q�$ߖ@rW�Ǹ�g@s�I�2�@s�o;��@t�OΎҗ@uc#�vmX@v*�5;@v�j���w@w�����_@x��;N��@y[�,�z�@z+�Eap�@z��@��@{�V���@|�J�l#�@}|��2��@~T�t��@-�:���@�@@ t#@�rFv�i@����`��@�PWM�$�@��Z�J�@�1�<��@��Jp2'�@�1}�#(        ?��f�:s@��6r@	⠎^@$^X�ސ�@.�Y�@5`S0jA@<@� ��@A��&��@F!�����@J�[s��a@O|zH��q@RO�]\�@U�U�[�@W�"�9�@Zٔo/�6@]�F���x@`��[��@bB�놂k@c�w���@e�*J�J@g�-pB��@i{��@ki���@md����@oj}zo��@p�0��a�@q̼�T�;@r��2�Q�@s� �~PE@u��o�2@v<r���@we(9�(+@x����>@y�eR��@z�*���@|7�{-(�@}w�x��Q@~��^���@�7�\�U@���F��B@�Q0����@���l�o�@��t�ݨ�@�W#ho�^@�Ҋ�ٶ@��}��T
@�o"ros@�%��E�@��L�04O@��ɀo�@�U-��Ve@�sW}"&@�Ӕ�Û�@����A,`@�YZ^�p�@�����@��XW��U@���M���@�zis��6@�G��2�@�
���=@�r�M��w@�ۄ��/�        ?���m?�?�[�Ӗ��@ ��Zڄq@f`<8�@*�hk�@<�,x-�@#'�_x(^@('J>�@-���GG�@1���G�@4ϳ�4#@8���J�@;�X��@?.�r�]@A{8Ⰲj@Cs����@E}�J���@G�(D���@I�"����@L
UIj�J@N[6��=@P^��&t@Q�vg@R�b=\A?@T��<j@Ul$�e�@V��|��@X��?D�@Y�m�͞�@Z�!*��@\YP{s�@]Μ��:@_J�}�@`e�L��i@a)m��x@a�N��@b�0J]�@c��A�\�@dQ�3Қ�@e"l�5P@e��+oOo@f�
CC�@g��r���@h}H�z�C@iY�t��'@j8��}'@kBIR��@k��<�	"@l�H�@m��"R_�@n�Z��G@o��_wE�@pH�3n�n@p���̤ @q:9s'��@q��0��@r/��4��@r�L��׈@s)��a
r@s���
7%@t'.8��@t�be�@u(��,�        ?�qp�52�?��b�z@������@m\K@͒'��@&:Q4��2@-w����@2����0�@7>u��;�@<��7��@@���Y�@Cp��&@Fed�,��@I�E��@L�ۤ�@PI��@Q�|*�@S�U,�_@U�,Q� @W�`�� 5@Y�Y����@[ǀ��=@]�C�AN-@`�	q�`@a5�-�y�@b^x�)e@c����(@d£G�]�@e�����@g>H�?X@h�hE�}�@i���d^�@k J�_��@lu��V��@m���R��@o.��HH.@pH�M="@p���I�@q����?�@rj��TD@s$r&�@s�H�( F@t��s�F�@u]��N�@v���0r@v��W�x�@w��?��r@xl����@y4����r@y�+ <��@z�0/vf@{�kHd�3@|c,���@}2KO���@~��S7@~�wf1f@@�sy�:@�=�E�2�@�����zs@�Ŝ��)@���1�@�����Y@�X��9�        ?�@/�h�?��Z�+@	�1r�?@Y�o��@ !ĽU	�@&���D��@-�|(��S@3W���m@7����kz@<�6Z�e�@@��1��@CցO�E[@F�8Z���@J��Ù@Mn��2<A@Pzi[��\@RQ�+}�@T:� ��@V6�f��@XDn�Pq@ZcK����@\�� ���@^����@`�x�@a�\l[�@b�}3/�@d2�+�2@ev�C��H@f��(N@h�f:^j@ih�o'�@j�RR�)@l(���5@m����@n�ɇ�G�@p9�	V�@p��� �@q��n�/@rv">Nc�@s9���A�@s��{w�)@tǎ��b�@u��?�[C@v]�ڹ�@w+ƾ�;�@w���:�@xͅ�{B�@y��eY@zvl<���@{Mg:@�@|%��	J�@} J���@}۳��\@~��V�ӊ@� F�r@�;l_v3J@����b/j@�)�@���k.,@� 3�1Z@�sюf��@��*�b�[@�[��&        ?�.,K�ɂ@zIa�c�@n��&��@#ډM-%@-�m_.!i@4���'�4@;���i�@A|wٰ�R@E��C��{@I���@N�?�,��@Q�Q#u�@Tw�:�O1@W<����i@Z"�S��@]&�fx�@`$����K@a�A�/T@cq��1h�@e,���A@f��F�@h�ܷit@j�>�vJ@l�D��%�@n�*��H@pJ���h�@qRdA�@r_u5�@sq�&ѯR@t�>.*q@u��Mޓ@v���\�@w���2@y���@zF��ۧ@{y���7@|��@}����@,�9�a,@�8&�\�@�������@��z ;^�@�(���N@��814k@�}E7'�@�*W�@�ؑ�m@���-P�@�:�.9�@��;g`ߧ@��w WI�@�ZXI㝴@��Z�7@��� �U�@���萐�@�E�ge(�@�����@��ǃ@��x�Z�m@�I���|@�)N���@��L��@�M�W�N{        ?�ĵ2��B?�;6y��@ ŋ��@"��N�@���i@�gs�#@"���#�!@'�N6��q@-0����@1t�͝bi@4��tlb1@7�e���k@;�2e	@>����@A/�쌎@CU��"�@E�S^�@G-K$��@IO�8��@K����^L@M�Em�%@P�u��2@Q=� is@RvU��@S�&V��@T��Dq�&@VJ�a]��@W��s2 @X����*u@ZZ�k�o�@[�A���a@]/��.�3@^��ax�`@`9�H@`�_�7�@a�}"���@bTF�̍L@c���M6@c�q`@d��6�*@e��<���@fR7/���@g%�u���@g��P@h�.���@i��9UG#@j�e��@kj2���@lK�s#�@m-�4��@n��<�5@n��
]z[@o�q�C��@pf�'�g�@p���n��@qT1��/�@q�i�3m@rE���&@r������@s:��.�a@s�rBP�l@t3&���@t��% ��        ?ݡ���9?��v�.c@���2L�@*�+�j@��O���@&J��`@-��=Q_M@2��+P�@7K�!P�@<&�y�@@�C?N��@C{L�O@Frb�1�@I��
�BH@L�i��@P(7iu5@Q�JG�h@S����C'@U��d���@W�5uwob@Y��6�!�@[�y寧�@^(Sz�<@`3��_�@aZ�[��@b��D;Gg@c�k�<�@d�y �2�@f9ǡ}�8@g�$7 ��@h�^�P]{@j!K<:�,@ky�X���@lכ�1k@n:�S���@o��p�� @p���@q@���=�@q�D��4�@r��U��@sy�u�@t;���JU@t���Z�@uŭIv�@v���K�@wW�@=u@x#��M@x�$�ߊ@y�W�գ@z��>��@{f	d��O@|:�$�R@}v�Y�@}鐺�}N@~�/�q��@�H��4�@�=i��Y@��bM�_(@�	���@��\�z�@��V�!��@�n�J�@��7����        ?��=�B�?���O���@�N|=@?�h��@��H=%@%]�=�]�@,RE��c�@2�}Dr@6T�fd�0@:�P��é@?��YJk@B��f/`�@E�'�W�#@H}��.�@K�1+9u@N�u�
@Q*w�-v�@R�H&$L@T��|3�@V�w�o��@X���9�b@Z����@\�x��@^ؑ$�/@`�G���@a�|@Ng�@b���WsE@c���0�@ei��/@fI��,@g�_T~@h�,���@j З�9@kF���U`@l� U�C@mᦦO(o@o5���@pF����m@p����%�@q�$��m@rV��o��@s
��)t�@s�jq'v@tw�`��@u0����@u릿�f`@v�TXXN@wf�0�@x%����k@x��"��@y�SSB��@zmS���{@{2�08�x@{�~�_H@@|��ǜ�@}�M��@@~U��q�R@!��f�@��a��@�^�R�@�ƣ5ǻ�@�/"�'�\@��>Z�        ?��Z_<�@������@�v"�
�@$Jʭ��E@.�HK�@5M�6w��@<*h�U�@A���\@F��0O@J�~��@OrnR�@RLM�AB@U����+@W�]���@Z�8}�@]��s@`���"u`@bJ!V�U�@d�o?@eϽñ( @g��`���@i��NBB<@kz�:���@mw@��@o~��B@p��϶��@q׈ui�J@r�}�c�@tx|ӓ@u"Q�Б�@vD存��@wl]�(�@x��Gnt@y��o��@z�!��gU@|4����@}q7��4�@~�ƿ�T�@�9[��'@��=G�X�@�E<��R�@����<@�����@�B&[�
�@��T�g#@��;Ă�N@�N��U�I@����<@���}�@�jeIu?�@�!l����@���C�$C@����5�@�O��Ǥ@��#�.�@��>�͐A@��8���P@�L��q @�h���+@�ӑ��~�@���?�#@�/��uQ�@���wv�        ?�`7�b�?�˅�;{�@`����F@.�z>ĥ@���o@���%@#�E���@(�@�� @.]����o@2*���K�@5W����@8�m�|9�@<;�7���@?�Ԥ��5@A�E&��@C狪��@E��b��@H$���+�@J^�AC��@L�?�a��@O�@;T@P����$@Q�����@S>ؚ���@T������@U�vI�r>@W=\����@X�eS@Z	h%X�@[y>c��2@\�r��c�@^k�黽�@_�;q�@`����@a����@bMf��@c���@c�[Fm@d���^�@e� �[@fk!���&@gEطt��@h#�'I@i�<1"@i��w��@j��yǴ�@k�ԯu=H@l�I��@m��g)^@nt;���@od���)@p+�'	n@p�	�w�@q!���5@q��K�7�@r���,@r��Q�s@sr�6H@s��\z@t,�N|�@t�i���@u ��2@u������        ?�^��d��?��
!�)@��\%@�����@��[���@&���M@-?�0��@2�:P��g@7���@;���T@@u�&x�@C1�E��@F�2��@I(5V�@L^މ�1
@O��.C�,@Q����@Sp�sv��@UT(U�0<@WG��2�@YK5z
�|@[]ѽ�wa@]����@_����e@`�̤�w@b����@cFY~��G@dw��s�@e�p^1��@f�rt��@h/��%$�@iw��S 2@j�R�C%Z@l�gP�p@mox.ZH@n��}�p�@po;�x@p�>?<~@q~J��2�@r5��n��@r��بj@s�;=��x@tg�Z=�k@u&�G��@u��K#[�@v��-@8�@wn�E�ET@x53�@x���6#@y��;y��@z��z,PS@{\�e��@|*d�xu@|�MU��@}ɋ5u��@~���b�@m�v�w@� �x�~�@������@��ń^;d@�b��z	�@���(��2@�;�A�6�        ?ݠ�h�?�
�Μ�@
=)3��K@J
���8@ Ϫ(�O@'}7]� x@/xu���@3�?���@8|)��t@=����@A��3 ,�@Do�޷P�@G��w'$ @J��"5@N4�MG7�@P����ɨ@R��dp�C@T�;Y�c�@V���0%@X���h�@Z�bҾ�@]��3�@_]���X@`��퇩�@b���֧@c?1{k�m@d}<���@e��jE@g��!@h^e� �@i���f}@kbL`3]@lv��T?@m���^S�@oN�A��h@papt��@qGڀ@q��N��j@r�ؤz�@sd|��nw@t+�7�+@t�C�� �@u�Om�Z@v��� �,@w`�e���@x3�CHl@y�1=�g@y�^�_��@z����@n@{��K�@|sm�T�@}S!?��V@~4�dV�@K���@��U!��@�rk���@���>�v�@�\:4�)�@��iX�Ȯ@�Il��0@��@�*�@�9�|G@��OK�`V        ?�>�fy@>��ޤ_@G���Y�@%k}�J�@0����@6z �`E@=��g�g�@B���a�@GH�Αn�@Lu��@P��1Y�f@SJM��@V(n�%��@Y,8���=@\T�{��@_�����d@a�+���P@cK-�m��@e �>�o+@gr��<�@h���\��@j�8#��@m	p����@o& �3@p��H+q'@q��*M��@r��E��J@t
�S��@u7��!�@vj�:�9@w��g�e�@x�=�:�}@z!�n��F@{i��4�@|��ݡ"<@~���x@`J �@�^A�x�@�����U@��W׆�o@�vq�Ԩq@�-���c�@��a�i@@��$�	�@�a�jfr@�!�sjp@��5'Ҵ@��b����@�m��~�@�5ˊ�j�@���E�V!@����q7�@�����#|@�iu���@�:�w�y�@��X�n@���")�@���AJ*@�HI�y�@���6��@�"NI���@��c&�-5@��*�4N�        ?�b�r�m�?��u^��@ �/W��@��6��g@�G~��@�>�j��@"��ݱ�M@'ɲ2+Z�@-&���~@1t���\�@4��a��g@7���J`@;3���@>�s�Cg@ADD�H#@C7x�	M9@E=�i/%�@GVfc���@I��i�G�@K��|�Ta@N	�8/m'@P36��1�@Qip��(�@R�:���S@S�\=�5S@U8����@V��E�yV@W�����@YFW`��@Z�e�iC@\ׄ���@]���Rd�@_s�^�B@`D,鞉�@a�1v�@a��N@@b������@c`�VJ@d/
q�|@d��P�E8@e�>�c�@f�6����@g���L[@h\�Z��@i9�����@jwY�%@j�Nv��o@k�Y:�-g@lŉ�M	B@m��R�9�@n�#|��@o�k�k@p9M�%v@p�VL.\e@q*LT�w�@q�-�X�@r�SLƝ@r��@�vH@sNǧ�h@s���c�K@tJ�q@t��8NӢ@u���Ig        ?ޓ�eſ�?������#@	����@��[>W@ ���� @'V^�q�@.��q�5A@3�l�ȮR@82 Y'8@=@k<��@AY ���@DBC@@GY���/@J��ȶ�@Nqc2��@P�]����@R�{�#�\@T�����]@V���sE�@X���xC@Z�x�� @]'�ԭ.!@_r(�|�@`�����@b���`@cV��%:y@d�q�O@e�"S{�L@g3eH��@h��(�@i�ʢlZ@kI�y��V@l��i�@n @�ZM�@o��JӔ@p�k�>�@qEv�Ϣ�@r �<Y@r����-'@s�D᳄@tY���)@u$��>�@u��o�@v��l��@w��f�@xe
'�@y:���@z�"$�@z�ÿ���@{�C>��@|�x��#@}~U,T`}@~]�Z�Qc@>�zd��@��܃i�@���zQ�@����Kv�@�h�
B�U@���1�@�Q�tm�@��a{���@�=tG*�@��#��>{        ?�L!�-s?��n3 q@��K�,�@Z����4@����?�@%�S]@,�L$s@21����H@6�`��[�@;9JH��g@@$���[@B؀��=�@E�t��@H�����@K�RC��@O;la߅B@QXfX�@S$w��^@U -�׃x@V���;�@X��(J�@Z��G7�@]Pb�<@_+�t?��@`��7�@aͲܼ��@b�
['@@dh`�0�@eM��ֲ@f�X��5@g�#��&�@h�����@jBm���@k��,I��@l�4k�@n+!m�M�@o�3���y@pm�.XEY@q��ho�@q�p˒� @r���l@s4~��.�@s����E@t�cx�g�@u[ę;c@v�w��@v�#ֹ��@w�	�R�Q@xPY���n@y��\�@y�)CMh@z�V���@{Z�&�@| �ڹ�@|�Q
�@}���� �@~x�{o�)@COg�n�@�]���{@�m��9B(@��P���g@�;�H��q@��-�-��        ?쀐嚷]@�*4��@���q�@$��^�>h@/no^�@5��mj�@=\q�6s@Bt��ϺD@F���\�@Kv�4�u�@P>/�{�)@R�"N}XW@U�h�o�Z@X�Vv$@[�^����@_�aL@a:럸V@b���/��@dʣS��x@f��+t�@h����c@j�PZ�$@l��3�@n� 8MĊ@pi���@q�?<�@r��Y1��@s��\	@t�l��@v��{zn@wM���6@x��~��@y�QM��@{��6@|Qk'�@}��MX��@~��Bi@�#Ҩv�@��oI�@��=�94�@�30��@�@��;�-i@��QW�m�@�Uh�9@�u`y@��mE���@��F�?�@�H�%�P�@�
u\L�@�ͻ�'k�@��� �K�@�Y|�lR%@�!�|�D@���B��@�����u@��Q �(@�S�2s��@�$F���@��%
�~�@�d�L	C�@�����K@�:0z���@����"G        ?�]7�
�?����o}�@ x6�P�@�7�_@���I�@�ä�@"����@'�޾{ҁ@,����@1HӾ�@4N��hm!@7��k;�@:���R��@>dL��V@A����@B�gj�\@D�M�x�@F��Ff@I�Z)-@K:,	�@Ms�'�@O�W	��@Q��,��@R8��I'^@So�^<�@T�$4,��@U�S	]@W9.M��,@X���<&)@Y�=�7R@[4$��J�@\���@]���$�@_\�Lx�5@`d���@a�Q��@a׭��6^@b��i�@cS�����@d��8��@d�̑=M@e��A��@fd��O�@g-!J7�@g��1�t@h��D��@i�sn��@jc�3�s@k6	����@l	�-iW@lߛß��@m����h�@n����x�@oj����z@p#` `U @p�F4H�t@q�5�X}@qrj��@q㤱��A@rU���7@r�Z-HB�@s;�^�J�@s����Y        ?�a_�+��?�������@	��]s@�>#j��@ _�8��@&��-<��@.ZN�~��@3Z�HR
�@7�f��N@<���߱@A,���S�@D�2ҷ@G�"�^@JW[A��:@M���}�@P��9<}�@R~�)��@Tk䨒"�@Vj�]e@X{k��9�@Z��Y<��@\�����@_1�w2�@`���>�@a�*�i@c��C��@dS2V�!@e�V�è@f�� �@,@h2�.���@i��|SL{@j�0�5#@lH[�Q w@m���me@o���*@pG-�cx @q{#�W�@q�$a4\�@r�@�O�@sBA�C�#@t�`!q�@t��)�.�@u�s.�b@v_���@w,B���@w���'��@xʔ���O@y�oۈv�@zp	�<@{EVc�Z@|Ki��@|��"��A@}��-Ml�@~������@��Ew�@�3��&�@���>��@���~�U@����3�@���b(O�@�iu��@�ܤ���@�Pl���        ?�	1%�IG?��W���@�ow�e4@8e�+�@���\@&N?i�@-�&4��@2�NWTr�@7\FrE��@<=38��@@�����@C�N�P��@F��� gj@I����@L�0�;�@P3"T�R�@Q��Ϙ,@Sܕ�s@U˥�pK7@W�nP+0�@Y�U�p��@[��nl��@^)k�̺�@`3T��Dy@aY
Sĥ*@b���ߺ@c��YW�U@d�y�0@f2[Ӣ0�@gxI���@h�@��Q@jr��T@klEV��@l�U��w@n)s%f�d@o�o����@p}ȉ�@q4�V���@q�.@r��O��@sh�Ux�@t(��䴸@t�Ӿ��@u����@vt���k�@w<p�g*g@x嗎�@x����@y��X	�P@zlI�I)$@{<G�K�,@|��ZkX@|�ګ�=�@}�b����@~�_��^�@bȻ�z�@��NHL�@���#��@���yRJS@�f���Ǩ@���~r:Z@�E�Ѹ�@���CZ5~        ?�A��Hي@N/N�m@C�^�?@$�W˪��@.�}�z�@5��Z�u�@<j���}@B	��R	
@F9 ��j@J��-�{1@O���Y�J@RY{bQ��@U�)��@W�ȗMgB@Z�lp$��@]�����Z@`��b�E@b9��#u@c�-̀�B@e�xnV�@g~=�_@iX,%7�@k=b�H�@m-i�d>@o'͘���@p����@q�
w�F�@r��d��@s�����I@t��$c�@u�Q;��w@w�-��@x"5r�\R@yFq��{v@znd�TW�@{��	K;q@|��o�@}�����@1P���@�5,E�//@��Bd���@�r�ËN�@�����G@���E�0@�Z����@� �}��@�����;�@�O1��u�@��Ő	6@���x��C@�O�˴�@��q�ފ+@��Ff�L�@�\c�o3@��q��S@��q!�h�@�t`5�R@�)��~Y@��
��5�@����B�/@�P�l�~@�
���t@��6�|�        ?��jcs�W?�m�Fa��@ ���ڢ�@�1த7@9Ӆ��@FX@!�e@#&�Ǎ�@(�4u<@-{=���@1������@4������@7�ܬ��\@;Qpf�	@>��r�ϣ@AK���|@C9�T� @E9�Gg#�@GK�A��@In����@K�\Lt�@M�Ŭ��@PG�>YD@QMU�[b@R��}@S��ʔ`~@U	� k�@VU��?&�@W�N�X@Y�C�@Z`���t@[��<F�@]/}����@^��ɐ�K@`
���@`�Ge��@a�gt:#�@bK����@c(���@cװK�h@d�����@em��ܶ@f<_���@g%<��@g���?q@h�6<��v@i�l�%z@je�3��@k@���|+@l/�d��@l�K0�(@m�;��\�@n��<ر�@o�oR���@pE�+h�@p�����@q.o��ߜ@q��v��G@r7ɜ��@r�>	ǧ,@s�x��@s�xH-�@s��n;,�@tt�4�T�        ?݊��h�?�a�߶m@	l'��@5t=�@���[�f@&Y���j@-���D�@2�����@7[Y2~W�@<93e7Z�@@�� c�@C��>�dy@F~ly�]�@I��=`U�@L�X�{�@P,��7I@Q���g�@SԀ(t�X@U¬�@W���9��@Yе�q��@[� z+�@^�c��}@`-��{W@aR�N���@b~�&�7@c���_�%@d���@f*�d?@gpC�F{@h�����@j��E�?@kc-�%��@l��٣Γ@n����F@o�����@px\n	@q/����@q��İ3@r���>:T@sc�̹�"@t$#M��@t�iyk]_@u����j@vp��Į @w8��p�E@x@4)�'@x͖����@y��R�4?@zi%9л@{9F�	�z@|
��7�@|�^Sa7@}��q�s@~�w5��:@_��d�*@�\��@���(C��@��w,ŕl@�d��C@���= i@�BE��MH@��􃑹         ?ۜQ�L��?�\z)���@�
$�Z@ؾ��d�@}u�u�@&���2@-8���	@2�dX�{�@7ꪅ�@;�N�KW@@�<(w�s@CK8��1@F:C'���@IR�Dz@L��HU}�@O��b�g@Q¦�k�@S�i{I�:@U�q�5n'@W}(B^:D@Y��sT(E@[�W�[�@]ȸd�B�@_����Z@a"OC|�@bK�Ӡ�a@c{����@d��	檑@eF,G@g1N�yt@hz�b��@iȜb},@kӷ�|@lv�{@m՜?��V@o9��l8�@pQ��6T$@q��]H@q�0�{�&@r}�B��@s;�Ȓ�@s�-M�M	@t�}�ӄ�@u��I��@vIF.���@w��~;@w����{	@x�#jx�@yv'#��@zE��GZ @{�����@{��1i�@|��iN4�@}�f����@~n��B�c@H��i<�@����@��rv^�@��=�@�_��?Z@��A��py@�A�����@�����{+        ?�Zh�5F�@��(�ǭ@� "Ǜ@$	�*^�@.+w��@5��{t�@;ͭ�S�@A�s~)`S@E��AҢ@J<���+@O ���@RteH�@T����?@W���c�@Zt*� ^@]���@`Y"ks]�@a��A7<@c���\*K@et
�Hb[@gBc���:@iJ�Xo�@kP�If�@l��t��@n�%~���@p�(3�@q����(@r���4 �@s��@c�@t��CJD@u�Ym\�@w�I�k3@x+��� �@yV��>C@z�[m�<�@{���S+@|�qQ&@~-0�M�@l�ζ �@�W� �\�@��n����@����F��@�G��M�@����:@��Tw��@�G����@���w���@��֯�@�V+y&�@���n| @���WA�@�r7Μ��@�)}��@��Aꦱ_@���W�#@�U��(�@��u��(@��3vG@�����g@�M���%�@���v�T@��Z�(Y@�Juh1Gr        ?ӥ��:��?�-�/v��@ �Gе�@P��_@�9_��@�,��\@"�*�	��@'��c��l@-/��O�@1u3?~@4�2�'!�@7�oB��@;� I@>�M^n?@A+�XӉ�@C�vp�@E���|?@G!K��j�@I?q�Ŀ@KmK	�4@M�;��&�@O��h�8�@Q'�4"�%@R[KU��@S����`�@T�+t,��@V�z\�@Wi����@X�I�L�i@ZGDv@[q���5@\��=�(�@^;#{{
@_��1'V@`����"�@aFJ����@b�3�-�@b���3��@c�-��Lu@dD��d>@e	A��@eϔ�=(@f��-��.@ga��s0P@h-'� `�@h�b��>�@i�7����@j����$@kk�5~fK@l>�|��@m�Q���@m��,�B@n�]�'^�@o���@p:��h@p��1d��@q��4�@q�MU�,@q��xJ�(@rc�Y@�@r�Ә���@sD��a�m@s��ύ�^        ?�����5?��)��@���)�@��OP��@\s�� ,@%��_Z�@-
�!,(@2���>B@6�ϊ�@;�\E��k@@dK>�@U@C �����@FZj{9y@I�*�6�@LM�!N�@O��4�@Q�v���`@SeՃ��@UG�A�~�@W:+��-@Y;�m@[L����@]k���U@_�DD	�@`�#a>��@b�>��L@c6��O@dei��<r@e�{��*�@f�	���(@h枪-W@iY�1��Y@j�աc�@k򐉒>�@mE�S7�@n��E{?�@o�
�wE�@p�C�Z@q_���|�@r�`S�K@r��Gj{@s� �bb�@t;��Û@t������@u��=�@vsʳ�p8@w4J�v�@w�T��y@x���Å@y~�=�?
@zEL-��7@{çOr@{�>�u�|@|����@}lW�U�@~935�@3��;�@�L�d@�S:n���@��Ю"��@�$�5�I@��r(�[:@��tvjh-        ?ۘ0iES?�\�Z��@�<T3��@�#��q�@��*^��@&�AdVq@-D���@2��j:�@7��H;@;���@@��x�Wd@C`1��h@FV]9@Iv|�7W@L�@U�1@P��vj�@Q�le���@S³���@U�ۋy�j@W�JA�:@Y�k�0�@[��e�@^��ʜ@`-����4@aU��_,W@b�g�:d@c� �$خ@d�z�W�@f9=�?@g�2�n��@h�#��@j%ܱ�F@k�,{�x�@l���3Ŗ@nD���@o���:��@p��$g�@qH��|�@r)�A��@rä��w@s�K��@tGY���@uՂG�)@uҘ`5�@v�E{RF@we��ε4@x2 M�zE@y 1P���@y��$���@z�[At/@{t^��D@|H��
��@}	4��@}�����@~ϡ�\@�_H�!@�B�%Ǌ@��y���@� ��?9@���V�g@� �E���@�r��`@���        ?�zo<�,@�A�[�x@�խ<`@#[/K�N�@-�kD��@4G���H�@:���il@@�G�޳�@D���{�H@I,n�.
�@M�)+��@QAڷ�L�@S�I�g�@Vq��e�@Y6�N�0@\
'�@_<S��@a�O9@b�0�e�@dO����@e�9ic�@g�+-5��@iy� �@kF�m�S{@m��B2�@n�[C@ps~�C��@qlMMV�@ri<���@sj'n�}�@tn�PL�@uwLe�̖@v�7���@w������@x���(�@y����!d@zә�G"�@{�^��s�@}����@~/�'��@S�! �K@�=vY>.0@��H+-�@�h`e�R2@����{��@��E	u�q@�1�\F�@���1�`T@�h�O6\@����b@���z11U@�B�n:I@��c���@@��^w�@�$�D�'�@���<T@�j>k�^�@�8�a�
@���H
��@�X����@��˃:X�@��٦4�w@�M�qdY�